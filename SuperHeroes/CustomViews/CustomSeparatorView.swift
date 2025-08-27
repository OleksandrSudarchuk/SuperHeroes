//
//  CustomSeparatorView.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 24/08/2025.
//

import UIKit
import SnapKit

class CustomSeparatorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private let viewSeparetor: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
}

extension CustomSeparatorView {
    func setupUI() {
        addSubview(viewSeparetor)
        
        viewSeparetor.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}
