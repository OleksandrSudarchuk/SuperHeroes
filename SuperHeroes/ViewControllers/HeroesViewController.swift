//
//  Heros.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 08/07/2025.
//

import UIKit

class HeroesViewController: UIViewController {
    
    //MARK: - Variables
    private var heroes: HeroAPI = []
    private var filterOfHeroes: HeroAPI = []
    private var isFiltering: Bool {
        return !(navigationItem.searchController?.searchBar.text?.isEmpty ?? true)
    }
    private var isSearching = false
    
    //MARK: - UIComponents
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HeroesCollectionViewCell.self, forCellWithReuseIdentifier: HeroesCollectionViewCell.identifier)
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSerchController()
        self.view.backgroundColor = .lightWhite
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        ApiManager.shared.getHero { [weak self] result in
            
            DispatchQueue.main.async {
                self?.heroes = result
                self?.collectionView.reloadData()
            }
        }
        
        
    }
    override func loadView() {
        view = collectionView
    }
    //MARK: - Functions
    func configureSerchController() {
        let searchController = UISearchController()
        searchController.searchBar.searchTextField.backgroundColor = .lightBlue
        searchController.searchBar.searchTextField.font = Typography.bodyMediumRegular()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search for a hero"
        
        navigationItem.searchController = searchController
    }
}
//MARK: - Extension for ViewController delegates and dataSours
extension HeroesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isFiltering ? filterOfHeroes.count: heroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroesCollectionViewCell.identifier, for: indexPath) as? HeroesCollectionViewCell else {
            fatalError("Failed to deque HeroesCollectionViewCell in HerosViewController")
        }
        let hero = isFiltering ? filterOfHeroes[indexPath.item]: heroes[indexPath.item]
        cell.configure(with: hero.images?.sm, heroName: hero.name?.capitalized ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activeArray = isFiltering ? filterOfHeroes: heroes
        let character = activeArray[indexPath.item]
        let detailVC = DetailHeroViewController()
        detailVC.hero = character
        navigationController?.pushViewController(detailVC, animated: true)
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
//MARK: - Extension Search Controller and Delegate
extension HeroesViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter  = searchController.searchBar.text, !filter.isEmpty else {return}
        isSearching = true
        filterOfHeroes = heroes.filter {$0.name?.lowercased().contains(filter.lowercased()) ?? false }
        collectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        filterOfHeroes.removeAll()
        collectionView.reloadData()
    }
}
