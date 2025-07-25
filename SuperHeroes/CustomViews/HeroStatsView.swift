//
//  HeroStatsView.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 22/07/2025.
//

import UIKit

class HeroStatsView: UIView {
//MARK: - Varibles and Constants

  
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
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
        view.backgroundColor = .purple
        return view
    }()

//MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(title: String, value: Float) {
        titleLabel.text = title
        
        let clamped = min(max(value, 0), 100)
        let percent  = CGFloat(clamped / 100)
        BarFillView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(percent)
        }
    }
}

extension HeroStatsView {
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
            make.top.equalTo(titleLabel.snp.bottom)
            make.centerY.equalToSuperview()
            make.height.equalTo(16)
        }
        
        BarFillView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(0)
        }
    }
}


