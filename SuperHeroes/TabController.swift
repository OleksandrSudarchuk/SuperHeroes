//
//  TabController.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 08/07/2025.
//

import UIKit

class TabController: UITabBarController {
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        seUpTabBar()
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = .primaryBlue
        self.tabBar.unselectedItemTintColor = .lightGray
        
    }
    //MARK: - Functions
    private func seUpTabBar() {
        let herosVC = createNavBar(with: "Heros", and: UIImage(systemName: "person") , vc: HeroesViewController())
        let newsVC = createNavBar(with: "News", and: UIImage(systemName: "newspaper") , vc: NewsViewController())
        let favoritesVC = createNavBar(with: "Favorite", and: UIImage(systemName: "star.circle") , vc: FavoriteViewController())
        self.setViewControllers([herosVC,newsVC,favoritesVC], animated: true)
    }
    
    func createNavBar(with titel: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = titel
        navController.tabBarItem.image = image
        navController.viewControllers.first?.navigationItem.title = titel + "Controller"
        navController.navigationBar.isTranslucent = false
        navController.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action:  #selector(didtaplogout))
        return navController
    }
    //MARK: - Selectors
    @objc func didtaplogout() {
        AuthManager.shared.logOut { [weak self] error in
            guard let self = self else {return}
            if let error = error {
                AlertManager.showLogoutErrorAlerm(on: self, with: error)
                return
            }
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.chekAuthentiction()
            }
        }
    }
}

