//
//  StatsBarView.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 22/07/2025.
//

import UIKit
import SnapKit

class StatsBarView: UIView {
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Components
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.bodySmallSemiBold()
        return label
    }()
    private let barBackgroundColor: UIView = {
        let view  = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.3)
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        return view
    }()
    private let BarFillView: UIView = {
        let view  = UIView()
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        view.backgroundColor = .primaryBlue
        return view
    }()
    
   
    //MARK: - Functions

    func configure(title: String, value: Float) {
        titleLabel.text = title
        
        let clamped = min(max(value, 0), 100)
        let percent  = CGFloat(clamped / 100)
        BarFillView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(percent)
        }
    }
}
//MARK: - Extenstion: SetupUI

extension StatsBarView {
    func setUp() {
        addSubview(titleLabel)
        addSubview(barBackgroundColor)
        barBackgroundColor.addSubview(BarFillView)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(4)
            //            make.width.equalTo(100)
        }
        
        barBackgroundColor.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(4)
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.bottom.equalToSuperview().inset(4)
            make.height.equalTo(16)
        }
        
        BarFillView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(0)
        }
    }
}


