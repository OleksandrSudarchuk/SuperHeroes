//
//  AuthHeaderView.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 13/08/2025.
//

import UIKit
import SnapKit

class AuthHeaderView: UIView {
    
    //MARK: - Init
    init(title: String, subTitle: String) {
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Components
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Icon")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.heading1()
        label.textColor = .darkBlack
        label.text = "Error"
        label.textAlignment = .center
        
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.bodyMediumRegular()
        label.textColor = .darkGray
        label.text = "Error"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
}

//MARK: - Extension
extension AuthHeaderView {
    func setupUI() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(123)
            make.width.equalTo(140)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(8)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            // make.height.equalTo(21)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom)
        }
    }
}
