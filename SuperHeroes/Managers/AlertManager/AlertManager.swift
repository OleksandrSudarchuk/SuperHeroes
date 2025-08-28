//
//  AlertManager.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 17/08/2025.
//

import Foundation
import UIKit

class AlertManager {
    private static func showBasicAlert(on vc: UIViewController, title: String, message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            vc.present(alert, animated: true)
        }
    }
}

//MARK: - Invalid Enter
extension AlertManager {
    public static func showInvalidEmailAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Email", message: "Please enter a valid email")
    }
    
    public static func showInvalidPasswordAlert (on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Password", message: "Please enter a valid password, must contain at list: 6 to 32 characters long, A-Z, a-z, 0-9, $ @ $ # ! % * ? &")
    }
    
    public static func showInvalidUserNameAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Username", message: "Please enter a valide Username")
    }
}

//MARK: - Registration error
extension AlertManager {
    public static func showRegistrationErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown Registration Error", message: nil)
    }
    
    public static func showRegistrationErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Registration Error", message: "\(error.localizedDescription)")
    }
    
}
//MARK: - Singin Error
extension AlertManager {
    public static func showSinginErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown Singin Error", message: nil)
    }
    
    public static func showSinginErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Singin Error", message: "\(error.localizedDescription)")
    }
    
}
//MARK: - Logout Error
extension AlertManager {
    public static func showLogoutErrorAlerm(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Unknown Logout Error", message: "\(error.localizedDescription)")
    }
    
}

//MARK: - Forgot Password
extension AlertManager {
    public static func showPasswordResetSent(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Password Reset Sent", message: nil)
    }
    
    public static func showErrorSendingPasswordReset(on vc: UIViewController, error: Error) {
        self.showBasicAlert(on: vc, title: "Error Sending Password Reset Email", message: "\(error.localizedDescription)")
    }
    
}

//MARK: - Fetching User Error
extension AlertManager {
    
    public static func showFetchUserError(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: " Unknown Fetch User Error", message: nil)
    }
    
    public static func showFetchUserError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error Fetching User", message: "\(error.localizedDescription)")
    }
    
}
