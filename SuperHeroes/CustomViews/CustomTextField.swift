//
//  CustomTextField.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 13/08/2025.
//

import UIKit

class CustomTextField: UITextField {
    
    //MARK: - Enum
    enum CustomTextFieldStyle {
        case userName
        case email
        case password
    }
    
    //MARK: - Variables
    private let authFieldType: CustomTextFieldStyle
    
    //MARK: - Init
    init(fieldType: CustomTextFieldStyle) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .lightWhite
        self.returnKeyType = .done
        self.layer.cornerRadius = 6
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.attributedPlaceholder = NSAttributedString(string: "", attributes: [.foregroundColor: UIColor.lightGray,
                                                                                 .font: Typography.bodyMediumRegular()
        ])
        
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 6, height: self.frame.size.height))
        
        switch fieldType {
        case .userName:
            self.placeholder = "type your username"
        case .email:
            self.placeholder = "type your email"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
        case .password:
            self.placeholder = "type your password"
            self.textContentType = .password
            self.isSecureTextEntry = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
