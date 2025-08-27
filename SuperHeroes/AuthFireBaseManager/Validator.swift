//
//  Validator.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 17/08/2025.
//

import Foundation

class Validator {
    static func isValidEmail(with email: String) -> Bool {
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.{1}[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: trimmedEmail)
    }
    static func isValidPassword(with password: String) -> Bool {
        let trimmedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$@$#!%*?&]).{6,32}$"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: trimmedPassword)
    }
    static func isValidUserName(with UserName: String) -> Bool {
        let trimmedUserName = UserName.trimmingCharacters(in: .whitespacesAndNewlines)
        let userNameRegEx = "\\w{4,24}"
        let userNamePred = NSPredicate(format: "SELF MATCHES %@", userNameRegEx)
        return userNamePred.evaluate(with: trimmedUserName)
    }
}
