//
//  DetailHeroViewController.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 19/07/2025.
//

import UIKit
import SDWebImage
import SnapKit


class DetailHeroViewController: UIViewController, UIGestureRecognizerDelegate {
    //MARK: - Variables and Constants
    var hero: HeroElement?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setupViews()
        //configureData()
        configureView()
        view.backgroundColor = .lightWhite
        
        self.navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    override func loadView() {
        view = scrollView
    }
    
    //MARK: - UI Components
    let scrollView = DetailHeroScrollView()
    
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
        scrollView.heroStatsView.configureStats(with: hero)
        
        
    }
    
}
