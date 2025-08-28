//
//  AuthManager.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 17/08/2025.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore

class AuthManager {
    static let shared = AuthManager()
    
    private init() {
        
    }
    
    public func registerUser(with userRequest: RegisterUserRequest, comletion: @escaping(Bool, Error?) -> Void) {
        let userName = userRequest.userName
        let email = userRequest.email
        let password = userRequest.password
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error { comletion(false, error)
                return
            }
            
            guard let result = result?.user else {
                comletion(false, nil)
                return
            }
            
            let db = Firestore.firestore()
            db.collection("users")
                .document(result.uid)
                .setData(["userName": userName, "email": email]) { error in
                    if let error = error {
                        comletion(false, error)
                        return
                    }
                    comletion(true, nil)
                }
        }
    }
    
    public func singInUser(with userRequest: LoginUserRequeste, complition: @escaping(Error?) -> Void) {
        
        Auth.auth().signIn(withEmail: userRequest.email , password: userRequest.password) { result, error in
            if let error = error {
                complition(error)
                return
            } else {
                complition(nil)
            }
        }
    }
    
    public func logOut(complition: @escaping(Error?) -> Void) {
        do {
            try Auth.auth().signOut()
            complition(nil)
        } catch let error {
            complition(error)
        }
    }
    
    public func forgotPassword(with email: String, complition: @escaping(Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            complition(error)
        }
    }
}
