//
//  DetailHeroViewController.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 19/07/2025.
//

import UIKit
import SDWebImage
import SnapKit
import CoreData


class DetailHeroViewController: UIViewController, UIGestureRecognizerDelegate {
    //MARK: - Variables and Constants
    var hero: HeroElement?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        configureView()
        configureStats()
        updateFavoriteIcon()
        view.backgroundColor = .lightWhite
        self.navigationItem.rightBarButtonItem = favoriteButton
        self.navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
    }
    override func loadView() {
        view = scrollView
    }
    
    //MARK: - UI Components
    let scrollView = DetailHeroScrollView()
 private lazy var favoriteButton = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(toggleFavorite))
    //MARK: - Functions
    
    func configureView() {
        scrollView.gender.value = hero?.appearance?.gender?.rawValue ?? "Unknown"
        scrollView.race.value = hero?.appearance?.race ?? "Unknown"
        scrollView.height.value = hero?.appearance?.height?.first ?? "Unknown"
        scrollView.weight.value = hero?.appearance?.weight?.last ?? "Unknown"
        scrollView.eyeColor.value = hero?.appearance?.eyeColor ?? "Unknown"
        scrollView.hairColor.value = hero?.appearance?.hairColor ?? "Unknown"
        scrollView.fullName.value = hero?.biography?.fullName ?? "Unknown"
        scrollView.alterEgos.value = hero?.biography?.alterEgos ?? "Unknown"
        scrollView.aliases.value = hero?.biography?.aliases?.joined(separator: ", ") ?? "Unknown"
        scrollView.placeOfBirth.value = hero?.biography?.placeOfBirth ?? "Unknown"
        scrollView.firstAppearance.value = hero?.biography?.firstAppearance ?? "Unknown"
        scrollView.publisher.value = hero?.biography?.publisher ?? "Unknown"
        scrollView.aligned.value = hero?.biography?.alignment?.rawValue ?? "Unknown"
        scrollView.occupation.value = hero?.work?.occupation ?? "Unknown"
        scrollView.base.value = hero?.work?.base ?? "Unknown"
        scrollView.groupAffiliation.value = hero?.connections?.groupAffiliation ?? "Unknown"
        scrollView.relatives.value = hero?.connections?.relatives ?? "Unknown"
        
        
        
    }
    
    func configureStats() {
        guard let apiHero = hero else {return}
        let vm = HeroStatsVM(api: apiHero)
        scrollView.heroStatsView.configure(with: vm)
    }
    
    private func updateFavoriteIcon() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let req: NSFetchRequest<Hero> = Hero.fetchRequest()
        req.fetchLimit = 1
        req.predicate = NSPredicate(format: "id == %@", NSNumber(value: hero?.id ?? 0))
        let isFavorite = (try? context.fetch(req).first?.isFavorite) ?? false
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: isFavorite ? "star.fill" : "star")
    }
    
    @objc private func toggleFavorite() {
        guard let apiHero = hero else {return}
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            let req: NSFetchRequest<Hero> = Hero.fetchRequest()
            req.fetchLimit = 1
            req.predicate = NSPredicate(format: "id == %@", NSNumber(value: apiHero.id ?? 0))
            
            let heroEntity = try context.fetch(req).first ?? Hero(context: context)
            heroEntity.id = Int64(apiHero.id ?? 0)
            heroEntity.name = apiHero.name ?? ""
            heroEntity.imageURL = apiHero.images?.sm
            heroEntity.strength = Int16(apiHero.powerstats?.strength ?? 0)
            heroEntity.intelligence = Int16(apiHero.powerstats?.intelligence ?? 0)
            heroEntity.speed = Int16(apiHero.powerstats?.speed ?? 0)
            heroEntity.durability = Int16(apiHero.powerstats?.durability ?? 0)
            heroEntity.power = Int16(apiHero.powerstats?.power ?? 0)
            heroEntity.combat = Int16(apiHero.powerstats?.combat ?? 0)
            
            heroEntity.isFavorite.toggle()
            heroEntity.favoritedAt = heroEntity.isFavorite ? Date() : nil
            heroEntity.updateAt = Date()
            
            try context.save()
            
            favoriteButton.image = UIImage(systemName: heroEntity.isFavorite ? "star.fill" : "star")
        } catch {
            print("Favorite toggle error:", error)
        }
        
    }
    
}
