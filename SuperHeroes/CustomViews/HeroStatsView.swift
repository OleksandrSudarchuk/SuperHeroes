//
//  HeroStatsView.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 21/08/2025.
//

import UIKit
import SnapKit
import SDWebImage

class HeroStatsView: UIView {
    
    var heroElement: HeroElement?
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setUpBorder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - UI Components
    
    private let imageAndStatsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()
    private let leftSubStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .lightWhite
        stackView.alignment = .center
        return stackView
    }()
    
    
    let imageHero: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        return image
    }()
    private let statsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.axis = .vertical
        stack.spacing = 2
        
        return stack
    }()
    
    private let statsView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightWhite
        return view
    }()
    let intelligence = StatsBarView()
    let strength = StatsBarView()
    let speed = StatsBarView()
    let durability = StatsBarView()
    let power = StatsBarView()
    let combat = StatsBarView()
    
    
  
    let heroName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Typography.bodyLargeSemiBold()
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Functions
    func configureStats(with stats: HeroElement?) {
        heroName.text = stats?.name ?? ""
        if let urlString = stats?.images?.sm, let url = URL(string: urlString) {
            imageHero.sd_setImage(with: url, placeholderImage: UIImage(systemName: "person"))
            
        } else {
            imageHero.image = UIImage(systemName: "person")
        }
        intelligence.configure(title: "intelligence", value: Float(stats?.powerstats?.intelligence ?? 0) )
        strength.configure(title: "strength", value: Float(stats?.powerstats?.strength ?? 0))
        speed.configure(title: "speed", value: Float(stats?.powerstats?.speed ?? 0))
        durability.configure(title: "durability", value: Float(stats?.powerstats?.durability ?? 0))
        power.configure(title: "power", value: Float(stats?.powerstats?.power ?? 0))
        combat.configure(title: "combat", value: Float(stats?.powerstats?.combat ?? 0))
    }
    private func setUpBorder() {
      
        layer.borderColor = UIColor.deepGray.cgColor
        layer.borderWidth = 1.5
        clipsToBounds = true
    }
}
//MARK: - Extension
extension HeroStatsView {
    func setupUI() {
        addSubview(imageAndStatsStack)
        imageAndStatsStack.addArrangedSubview(leftSubStack)
        leftSubStack.addArrangedSubview(imageHero)
        leftSubStack.addArrangedSubview(heroName)
        imageAndStatsStack.addArrangedSubview(statsView)
        statsView.addSubview(statsStackView)
        statsStackView.addArrangedSubview(intelligence)
        statsStackView.addArrangedSubview(strength)
        statsStackView.addArrangedSubview(speed)
        statsStackView.addArrangedSubview(durability)
        statsStackView.addArrangedSubview(power)
        statsStackView.addArrangedSubview(combat)
        
        
        imageAndStatsStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            // make.height.equalTo(160)
            
        }
        leftSubStack.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.3)
        }
        
        imageHero.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(imageHero.snp.width).multipliedBy(1.7)
        }
        heroName.snp.makeConstraints { make in
            make.width.equalTo(imageHero.snp.width)
        }
        
        statsView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.7)
            make.top.bottom.equalToSuperview()
            // make.height.equalTo(160)
        }
        statsStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            // make.height.equalTo(200)
        }
        
        [intelligence, strength, speed, durability, power, combat].forEach { $0.snp.makeConstraints { make in
         
        } }

        
    }
}
