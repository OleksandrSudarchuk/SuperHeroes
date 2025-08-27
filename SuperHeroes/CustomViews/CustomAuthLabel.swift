//
//  CustomAuthLabel.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 13/08/2025.
//

import UIKit

class CustomAuthLabel: UILabel {
    
    //MARK: - Enum
    
    enum CustomLabelStyle {
        case email
        case password
        case userName
    }
    //MARK: - Functions
    private let authCustomLabel: CustomLabelStyle
    
    //MARK: - Init
    
    init(labelStyle: CustomLabelStyle) {
        self.authCustomLabel = labelStyle
        super.init(frame: .zero)
        
        self.backgroundColor = .lightWhite
        self.textAlignment = .left
        self.font = Typography.bodyLargeSemiBold()
        
        switch labelStyle {
        case .email:
            self.text = "email"
        case .password:
            self.text = "password"
        case .userName:
            self.text = "username"
        }
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
