//
//  LoginViewController.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 13/08/2025.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    //MARK: - Variables
    private let loginView = LoginView()
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightWhite
        loginView.forgotPasswordButton.addTarget(self, action: #selector(didTapForgotButton), for: .touchUpInside)
        loginView.loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        loginView.loginGoogleButton.addTarget(self, action: #selector(didTapLoginGoogleButton), for: .touchUpInside)
        loginView.singupButton.addTarget(self, action: #selector(didTapSingupButton), for: .touchUpInside)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loginView.emailTextField.becomeFirstResponder()
        loginView.emailTextField.isHidden = false
    }
    override func loadView() {
        view = loginView
    }
    
    
    //MARK: - Selectors
    @objc func didTapForgotButton() {
        let vc = ForgotViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func didTapLoginButton() {
        let loginRequeste = LoginUserRequeste(email: loginView.emailTextField.text ?? "", password: loginView.passwordTextField.text ?? "")
        
        if !Validator.isValidEmail(with: loginRequeste.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        if !Validator.isValidPassword(with: loginRequeste.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        AuthManager.shared.singInUser(with: loginRequeste) { [weak self] error in
            guard let self = self else {return}
            if let error = error {
               // self.showAuthError(error)
                AlertManager.showSinginErrorAlert(on: self, with: error)
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.chekAuthentiction()
            }
        }
        
    }
    @objc func didTapLoginGoogleButton() {
        
    }
    @objc func didTapSingupButton() {
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
//    
//    private func showAuthError(_ error: Error, title: String = "Sign in error") {
//        let ns = error as NSError
//
//        if let authError = AuthErrorCode(_bridgedNSError: ns) {
//            let code = authError.code
//            print("[AUTH]", title, "code:", code, "desc:", ns.localizedDescription)
//
//            let message: String
//            switch code {
//            case .invalidEmail:      message = "Неверный формат email."
//            case .userNotFound:      message = "Пользователь не найден."
//            case .wrongPassword:     message = "Неверный пароль."
//            case .userDisabled:      message = "Аккаунт отключён."
//            case .tooManyRequests:   message = "Слишком много попыток. Попробуйте позже."
//            case .invalidCredential: message = "Недействительные учётные данные."
//            default:                 message = ns.localizedDescription
//            }
//
//            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default))
//            present(alert, animated: true)
//        } else {
//            // Ошибка не от Auth → показываем как есть
//            print("[AUTH]", title, "non-Auth error:", ns.localizedDescription)
//
//            let alert = UIAlertController(title: title,
//                                          message: ns.localizedDescription,
//                                          preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default))
//            present(alert, animated: true)
//        }
//    }
}
