//
//  CustomOrSeparatorView.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 13/08/2025.
//

import UIKit
import SnapKit

class CustomOrSeparatorView: UIView {
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    //MARK: - Init
    //MARK: - UI Components
    //MARK: - Functions
    //MARK: - Extension
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Components
    private let leftSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let rightSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let orLabel: UILabel = {
        let label = UILabel()
        label.text = "or"
        label.font = Typography.bodyMediumRegular()
        label.textColor = .lightGray
        return label
    }()
    
    
}

//MARK: - Extension
extension CustomOrSeparatorView {
    func setupUI() {
        addSubview(leftSeparator)
        addSubview(orLabel)
        addSubview(rightSeparator)
        
        
        leftSeparator.snp.makeConstraints { make in
            make.centerY.equalTo(orLabel)
            make.leading.equalToSuperview()
            make.trailing.equalTo(orLabel.snp.leading).inset(-8)
            make.height.equalTo(1)
        }
        
        orLabel.snp.makeConstraints { make in
            make.width.equalTo(17)
            make.height.equalTo(22)
            make.center.equalToSuperview()
        }
        
        rightSeparator.snp.makeConstraints { make in
            make.centerY.equalTo(orLabel)
            make.leading.equalTo(orLabel.snp.trailing).inset(-8)
            make.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}
