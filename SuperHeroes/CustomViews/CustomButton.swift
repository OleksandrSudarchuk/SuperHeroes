//
//  CustomButton.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 13/08/2025.
//

import UIKit

class CustomButton: UIButton {
    
    //MARK: - Enum
    enum FontSize {
        case main
        case google
        case small
    }
    //MARK: - Init
    init(title: String, fontSize: FontSize) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        
        switch fontSize {
        case .main:
            self.titleLabel?.font = Typography.button()
            self.layer.cornerRadius = 12
            self.backgroundColor = .primaryBlue
            self.setTitleColor(.lightWhite, for: .normal)
        case .google:
            self.titleLabel?.font = Typography.button()
            self.layer.cornerRadius = 12
            self.setTitleColor(.primaryBlue, for: .normal)
            self.layer.borderWidth = 1.5
            self.layer.borderColor = UIColor.primaryBlue.cgColor
            self.tintColor = .white
            //set google image view
            var config = UIButton.Configuration.filled()
            config.image = UIImage(named: "icons-google")
            config.imagePadding = 8
            config.imagePlacement = .leading
            
            self.configuration = config
            
        case .small:
            self.backgroundColor = .clear
            self.titleLabel?.font = Typography.bodyMediumRegular()
            self.setTitleColor(.primaryBlue, for: .normal)
            
            var config = UIButton.Configuration.plain()
            config.contentInsets = .zero
            config.baseBackgroundColor = .primaryBlue
            config.buttonSize = .mini
            config.titleAlignment = .leading
            
            
            self.configuration = config
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
