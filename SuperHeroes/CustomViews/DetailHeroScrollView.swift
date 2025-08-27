//
//  DetailHeroScrollView.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 21/08/2025.
//

import UIKit
import SnapKit

class DetailHeroScrollView: UIView {
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - UI Components
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    let heroStatsView = HeroStatsView()
    
    private let physicalInfoStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    private let physicalInfo = CustomDetailHeroLabel(style: .mainTitle("Physical Info"))
    let gender = CustomDetailHeroLabel(style: .subTitle(title: "Gender:", value: "") )
    let race = CustomDetailHeroLabel(style: .subTitle(title: "Race:", value: ""))
    let height = CustomDetailHeroLabel(style: .subTitle(title: "Height:", value: ""))
    let weight = CustomDetailHeroLabel(style: .subTitle(title: "Weight:", value: ""))
    let eyeColor = CustomDetailHeroLabel(style: .subTitle(title: "Eye color:", value: ""))
    let hairColor = CustomDetailHeroLabel(style: .subTitle(title: "Hair color:", value: "") )
    
    private let biographyStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    private let biography = CustomDetailHeroLabel(style: .mainTitle("Biography") )
    let fullName = CustomDetailHeroLabel(style: .subTitle(title: "Full name:", value: ""))
    let alterEgos = CustomDetailHeroLabel(style: .subTitle(title: "Alter egos:", value: ""))
    let aliases = CustomDetailHeroLabel(style: .subTitle(title: "Aliases:", value: ""))
    let placeOfBirth = CustomDetailHeroLabel(style: .subTitle(title: "Place of birth:", value: "") )
    let firstAppearance = CustomDetailHeroLabel(style: .subTitle(title: "First appearnces:", value: "") )
    let publisher = CustomDetailHeroLabel(style: .subTitle(title: "Publisher:", value: ""))
    let aligned = CustomDetailHeroLabel(style: .subTitle(title: "Aligned:", value: ""))
    
    private let workStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    private let work = CustomDetailHeroLabel(style: .mainTitle("Work"))
    let occupation = CustomDetailHeroLabel(style: .subTitle(title: "Occupation:", value: "") )
    let base = CustomDetailHeroLabel(style: .subTitle(title: "Base", value: "") )

    private let connectionsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    let connections = CustomDetailHeroLabel(style: .mainTitle("Connections"))
    let groupAffiliation = CustomDetailHeroLabel(style: .subTitle(title: "Group Affiliation:", value: "") )
    let relatives = CustomDetailHeroLabel(style: .subTitle(title: "Relatives:", value: ""))
    
}
//MARK: - Extension
extension DetailHeroScrollView {
    func setupUI() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(heroStatsView)
        mainStackView.addArrangedSubview(physicalInfoStack)
        physicalInfoStack.addArrangedSubview(physicalInfo)
        physicalInfoStack.addArrangedSubview(gender)
        physicalInfoStack.addArrangedSubview(race)
        physicalInfoStack.addArrangedSubview(height)
        physicalInfoStack.addArrangedSubview(weight)
        physicalInfoStack.addArrangedSubview(eyeColor)
        physicalInfoStack.addArrangedSubview(hairColor)
        mainStackView.addArrangedSubview(biographyStack)
        biographyStack.addArrangedSubview(biography)
        biographyStack.addArrangedSubview(fullName)
        biographyStack.addArrangedSubview(alterEgos)
        biographyStack.addArrangedSubview(aliases)
        biographyStack.addArrangedSubview(placeOfBirth)
        biographyStack.addArrangedSubview(firstAppearance)
        biographyStack.addArrangedSubview(publisher)
        biographyStack.addArrangedSubview(aligned)
        mainStackView.addArrangedSubview(workStack)
        workStack.addArrangedSubview(work)
        workStack.addArrangedSubview(occupation)
        workStack.addArrangedSubview(base)
        mainStackView.addArrangedSubview(connectionsStack)
        connectionsStack.addArrangedSubview(connections)
        connectionsStack.addArrangedSubview(groupAffiliation)
        connectionsStack.addArrangedSubview(relatives)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.greaterThanOrEqualTo(mainStackView)
            
        }
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
        
        heroStatsView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(280)
        }
        physicalInfoStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        physicalInfo.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
        gender.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        race.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
        height.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
        weight.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
        eyeColor.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
        hairColor.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
        
        biographyStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        biography.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
        fullName.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
        alterEgos.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
        aliases.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
        placeOfBirth.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
        firstAppearance.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
        publisher.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
        aligned.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
        
        workStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        work.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
        occupation.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
        base.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
        
        connectionsStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        connections.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
        
        groupAffiliation.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
        relatives.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
        
    }
}
