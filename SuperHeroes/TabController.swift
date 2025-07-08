//
//  TabController.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 08/07/2025.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        seUpTabBar()
        self.tabBar.isTranslucent = false
    }
    private func seUpTabBar() {
        let herosVC = createNavBar(with: "Heros", and: UIImage(systemName: "person") , vc: HerosViewController())
        let newsVC = createNavBar(with: "News", and: UIImage(systemName: "newspaper") , vc: NewsViewController())
        let favoritesVC = createNavBar(with: "Favorite", and: UIImage(systemName: "star.circle") , vc: FavoriteViewController())
        let statsVC = createNavBar(with: "PowerStats", and: UIImage(systemName: "bolt") , vc: StatsViewController())
        self.setViewControllers([herosVC,newsVC,favoritesVC, statsVC], animated: true)
    }

    func createNavBar(with titel: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = titel
        navController.tabBarItem.image = image
        navController.viewControllers.first?.navigationItem.title = titel + "Controller"
        navController.navigationBar.isTranslucent = false
        navController.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Button", style: .plain, target: nil, action: nil)
        return navController
    }
}

