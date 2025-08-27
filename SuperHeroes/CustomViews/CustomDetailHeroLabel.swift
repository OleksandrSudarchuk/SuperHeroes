//
//  CustomDetailHeroLabel.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 16/08/2025.
//

import UIKit


class CustomDetailHeroLabel: UILabel {
    //MARK: - Init
    //MARK: - UI Components
    //MARK: - Functions
    //MARK: - Extension
    
    enum CustomDetailHeroLabelStyle {
        case mainTitle(String)
        case subTitle(title: String, value: String)
    }
    private var title: String = ""
    var value: String = "" {
        didSet {
            updateLabel()
        }
    }
    
    init(style: CustomDetailHeroLabelStyle) {
        super.init(frame: .zero)
        
        self.backgroundColor = .lightWhite
        self.textColor = .darkBlack
        self.numberOfLines = 0
        
        
        switch style {
        case .mainTitle(let text):
            self.font = Typography.heading2()
            self.textAlignment = .center
            self.text = text
            
            
        case .subTitle(let title, let value):
            self.title = title
            self.value = value
            self.textAlignment = .left
            updateLabel()
            
        }
        
    }
    private func updateLabel() {
        let fullText = "\(title) \(value)"
        
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.font, value: Typography.bodyLargeRegular(), range: NSRange(location: 0, length: title.count))
        attributedString.addAttribute(.font, value: Typography.bodyLargeSemiBold(), range: NSRange(location: title.count + 1, length: value.count))
        self.attributedText = attributedString
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
