//
//  ForgotViewController.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 13/08/2025.
//

import UIKit
import FirebaseAuth

class ForgotViewController: UIViewController {
    //MARK: - Variables
    private let forgotView = ForgotView()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightWhite
        forgotView.sendButton.addTarget(self, action: #selector(didTapSendButton), for: .touchUpInside)
    }
    
    override func loadView() {
        view = forgotView
    }
    
    //MARK: - Selectors
    @objc func didTapSendButton() {
        let email = forgotView.emailTextField.text ?? ""
        if !Validator.isValidEmail(with: email) {
            AlertManager.showInvalidEmailAlert(on: self)
        }
        AuthManager.shared.forgotPassword(with: email) { [weak self] error in
            guard let self = self else {return}
            if let error = error {
                AlertManager.showErrorSendingPasswordReset(on: self, error: error)
                return
            }
            AlertManager.showPasswordResetSent(on: self)
        }
    }
}
