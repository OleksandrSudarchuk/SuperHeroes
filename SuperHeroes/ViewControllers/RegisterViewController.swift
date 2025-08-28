//
//  RegisterViewController.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 13/08/2025.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    //MARK: - Function
    private let registerView = RegisterView()
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightWhite
        registerView.termTextView.delegate = self
        registerView.singinButton.addTarget(self, action: #selector(didTapSinginButton), for: .touchUpInside)
        registerView.singupButton.addTarget(self, action: #selector(didTapSingupButton), for: .touchUpInside)
        registerView.singupGoogleButton.addTarget(self, action: #selector(didTapSingupGoogleButton), for: .touchUpInside)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        registerView.userNameTextField.becomeFirstResponder()
        
    }
    
    override func loadView() {
        view = registerView
    }
    
    
    //MARK: - Selectors
    @objc private func didTapSinginButton() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @objc private func didTapSingupButton() {
        
        let registerRequeste = RegisterUserRequest(email: registerView.emailTextField.text ?? "", userName: registerView.userNameTextField.text ?? "", password: registerView.passwordTextField.text ?? "")
        
        if !Validator.isValidUserName(with: registerRequeste.userName) {
            AlertManager.showInvalidUserNameAlert(on: self)
            return
        }
        if !Validator.isValidEmail(with: registerRequeste.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        if !Validator.isValidPassword(with: registerRequeste.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        AuthManager.shared.registerUser(with: registerRequeste) { [weak self] wasRegister, error in
            guard let self = self else {return}
            
            if let error = error {
                AlertManager.showRegistrationErrorAlert(on: self, with: error)
            }
            if wasRegister {
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                    sceneDelegate.chekAuthentiction()
                } else {
                    AlertManager.showRegistrationErrorAlert(on: self)
                }
            }
        }
        
    }
    @objc private func didTapSingupGoogleButton() {
        
    }
}

//MARK: - Extension: TextViewDelegate

extension RegisterViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        showWebViewerController(with: URL.absoluteString)
        
        return false
    }
    
    private func showWebViewerController(with urlString: String) {
        let vc = WebViewerController(urlString: urlString)
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
    }
}
