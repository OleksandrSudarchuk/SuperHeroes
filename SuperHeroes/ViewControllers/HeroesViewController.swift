//
//  Heros.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 08/07/2025.
//

import UIKit

class HeroesViewController: UIViewController {
    //MARK: - Varibles
    private var heros: Hero = []
    //MARK: - UIComponents
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HeroesCollectionViewCell.self, forCellWithReuseIdentifier: HeroesCollectionViewCell.identifier)
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.backgroundColor = .red
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        ApiManager.shared.getHero { [weak self] result in
           
            DispatchQueue.main.async {
                self?.heros = result
                self?.collectionView.reloadData()
            }
        }
        
        
    }
    override func loadView() {
        view = collectionView
    }
}
//MARK: - Extension for ViewController delegates and dataSours
extension HeroesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        heros.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroesCollectionViewCell.identifier, for: indexPath) as? HeroesCollectionViewCell else {
            fatalError("Failed to deque HeroesCollectionViewCell in HerosViewController")
        }
        let hero = heros[indexPath.item]
        cell.configure(with: hero.images?.sm, heroName: hero.name?.capitalized ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (self.view.frame.width/3)-1.34
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    
}

