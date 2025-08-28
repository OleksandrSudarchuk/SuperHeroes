//
//  StatsTableViewCell.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 16/07/2025.
//

import UIKit
import SnapKit
import SDWebImage


class StatsTableViewCell: UITableViewCell {
    
    //MARK: - Identifier
    let identifier = "StatsTableViewCell"
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        statsView.setContentCompressionResistancePriority(.required, for: .vertical)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Components
    let statsView = HeroStatsView()
    
    //MARK: - Function
    func apply(_ vm: HeroStatsVM) {
        statsView.configure(with: vm)
    }
   
}

//MARK: - Extension
extension StatsTableViewCell {
    func setupUI() {
        addSubview(statsView)
        
        statsView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.top.bottom.equalToSuperview().inset(4)
        }
    }
}
