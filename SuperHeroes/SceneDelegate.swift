//
//  SceneDelegate.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 08/07/2025.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
     setUpWindow(with: scene)
        chekAuthentiction()

      
      
    }
    func switchToLoginRoot() {
        // Создаём логин-экран в навигации
        let login = LoginViewController()
        let root = UINavigationController(rootViewController: login)
        root.navigationBar.isTranslucent = false

        // Берём текущее окно
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = scene.windows.first else { return }

        // На всякий случай закрываем модалки и сбрасываем уровень окна
        window.rootViewController?.dismiss(animated: false, completion: nil)
        window.windowLevel = .normal

        // Меняем root
        window.rootViewController = root
        window.makeKeyAndVisible()

        // Красивый переход (опционально)
        UIView.transition(
            with: window,
            duration: 0.25,
            options: .transitionCrossDissolve,
            animations: nil,
            completion: nil
        )
    }
    private func setUpWindow(with scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        self.window?.makeKeyAndVisible()
    }
    public func chekAuthentiction() {
        if Auth.auth().currentUser == nil {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.window?.rootViewController = nav
        } else {
            let vc = TabController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.window?.rootViewController = nav
        }
    }
}

