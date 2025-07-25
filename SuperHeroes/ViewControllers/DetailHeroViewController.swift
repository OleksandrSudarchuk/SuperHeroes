//
//  DetailHeroViewController.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 19/07/2025.
//

import UIKit
import SDWebImage
import SnapKit


class DetailHeroViewController: UIViewController, UIGestureRecognizerDelegate {
    //MARK: - Varible and Constant
    var hero: HeroElement?
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureData()
        view.backgroundColor = .magenta
        
        self.navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    //MARK: - UI Components
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        //stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
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
        stackView.backgroundColor = .gray
        stackView.alignment = .center
        return stackView
    }()
    
    private let imageContentView: UIView = {
        let view = UIView()
        return view
    }()
    private let imageHero: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        return image
    }()
    private let statsStackView: UIStackView = {
        let stack = UIStackView()
       // stack.spacing = 4
        stack.distribution = .fill
        stack.axis = .vertical
    
        return stack
    }()
    
   private let intelligence = HeroStatsView()
   private let strength = HeroStatsView()
   private let speed = HeroStatsView()
   private let durability = HeroStatsView()
   private let power = HeroStatsView()
   private let combat = HeroStatsView()
    
    
    private let stats: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private let heroName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let physicalInfoStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private let physicalInfo: UILabel = {
        let label = UILabel()
        label.text = "Physical Info"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let gender: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let race: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let height: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let weight: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let eyeColor: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let hairColor: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let biographyStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
       // stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private let biography: UILabel = {
        let label = UILabel()
        label.text = "Biography"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let fullName: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let alterEgos: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let aliases: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let placeOfBirth: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let firstAppearance: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let publisher: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let aligned: UILabel = {
        let label = UILabel()
        return label
    }()
    private let workStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private let work: UILabel = {
        let label = UILabel()
        label.text = "Work"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let occupation: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let base: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let connectionsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private let connections: UILabel = {
        let label = UILabel()
        label.text = "Connections"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let groupAffiliation: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let relatives: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: - Functions
     func configureData() {
         if let urlString = hero?.images?.sm, let url = URL(string: urlString) {
            imageHero.sd_setImage(with: url, placeholderImage: UIImage(systemName: "person"))
            
        } else {
            imageHero.image = UIImage(systemName: "person")
        }
        heroName.setFormatForLabel(title: "Hero", value: hero?.name ?? "Unknown")
        gender.setFormatForLabel(title: "Gender", value: hero?.appearance?.gender?.rawValue ?? "Unknown")
        race.setFormatForLabel(title: "Race", value: hero?.appearance?.race ?? "Unknown")
        height.setFormatForLabel(title: "Hieght", value: hero?.appearance?.height?.first ?? "Unknown")
        weight.setFormatForLabel(title: "Weight", value: hero?.appearance?.weight?.last ?? "Unknown")
        eyeColor.setFormatForLabel(title: "Eye color", value: hero?.appearance?.eyeColor ?? "Unknown")
        hairColor.setFormatForLabel(title: "Hair color", value: hero?.appearance?.hairColor ?? "Unknown")
        fullName.setFormatForLabel(title: "Full name", value: hero?.biography?.fullName ?? "Unknown")
        alterEgos.setFormatForLabel(title: "Alter egos", value: hero?.biography?.alterEgos ?? "Unknown")
        aliases.setFormatForLabel(title: "Aliases", value: hero?.biography?.aliases?.joined(separator: ", ") ?? "Unknown")
        placeOfBirth.setFormatForLabel(title: "Place of Birth", value: hero?.biography?.placeOfBirth ?? "Unknown")
        firstAppearance.setFormatForLabel(title: "First appearance", value: hero?.biography?.firstAppearance ?? "Unknown")
        publisher.setFormatForLabel(title: "Publisher", value: hero?.biography?.publisher ?? "Unknown")
        aligned.setFormatForLabel(title: "Alignmet", value: hero?.biography?.alignment?.rawValue ?? "Unknown")
        occupation.setFormatForLabel(title: "Occupation", value: hero?.work?.occupation ?? "Unknown")
        base.setFormatForLabel(title: "Base", value: hero?.work?.base ?? "Unknown")
        groupAffiliation.setFormatForLabel(title: "Group affiliation", value: hero?.connections?.groupAffiliation ?? "Unknown")
        relatives.setFormatForLabel(title: "Relatives", value: hero?.connections?.relatives ?? "Unknown")
         
         intelligence.configure(title: "Intelligence", value: Float(hero?.powerstats?.intelligence ?? 0))
         strength.configure(title: "Strength", value: Float(hero?.powerstats?.strength ?? 0))
         speed.configure(title: "Speed", value: Float(hero?.powerstats?.speed ?? 0))
         durability.configure(title: "Durability", value: Float(hero?.powerstats?.durability ?? 0))
         power.configure(title: "Power", value: Float(hero?.powerstats?.power ?? 0))
         combat.configure(title: "Combat", value: Float(hero?.powerstats?.combat ?? 0))

    }
    
        func loadImage(from url: URL, into image: UIImageView) {
            URLSession.shared.dataTask(with: url) { data, responce, error in
                
                guard let data = data, error == nil else {return}
                DispatchQueue.main.async {
                    self.imageHero.image = UIImage(data: data)
                }
            }
            .resume()
        }
        
    }
    

    extension UILabel {
        func setFormatForLabel(title: String, value: String) {
            let fullText = "\(title): \(value)"
            let attributedText = NSMutableAttributedString(string: fullText)
            
            attributedText.addAttribute(.font, value: self.font!, range: NSRange(location: 0, length: title.count + 1))
            attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: self.font.pointSize), range: NSRange(location: title.count + 2, length: value.count))
            self.attributedText = attributedText
            
        }
    }
//MARK: - Extention
extension DetailHeroViewController {
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(imageAndStatsStack)
        imageAndStatsStack.addArrangedSubview(leftSubStack)
        leftSubStack.addArrangedSubview(imageHero)
        leftSubStack.addArrangedSubview(heroName)
        imageAndStatsStack.addArrangedSubview(stats)
        stats.addSubview(statsStackView)
        statsStackView.addArrangedSubview(intelligence)
        statsStackView.addArrangedSubview(strength)
        statsStackView.addArrangedSubview(speed)
        statsStackView.addArrangedSubview(durability)
        statsStackView.addArrangedSubview(power)
        statsStackView.addArrangedSubview(combat)
        mainStackView.addArrangedSubview(physicalInfoStack)
        mainStackView.addArrangedSubview(biographyStack)
        mainStackView.addArrangedSubview(workStack)
        mainStackView.addArrangedSubview(connectionsStack)
        //physicalInfoStack.addArrangedSubview(heroName)
        physicalInfoStack.addArrangedSubview(physicalInfo)
        physicalInfoStack.addArrangedSubview(gender)
        physicalInfoStack.addArrangedSubview(race)
        physicalInfoStack.addArrangedSubview(height)
        physicalInfoStack.addArrangedSubview(weight)
        physicalInfoStack.addArrangedSubview(eyeColor)
        physicalInfoStack.addArrangedSubview(hairColor)
        biographyStack.addArrangedSubview(biography)
        biographyStack.addArrangedSubview(fullName)
        biographyStack.addArrangedSubview(alterEgos)
        biographyStack.addArrangedSubview(aliases)
        biographyStack.addArrangedSubview(placeOfBirth)
        biographyStack.addArrangedSubview(firstAppearance)
        biographyStack.addArrangedSubview(publisher)
        biographyStack.addArrangedSubview(aligned)
        workStack.addArrangedSubview(work)
        workStack.addArrangedSubview(occupation)
        workStack.addArrangedSubview(base)
        connectionsStack.addArrangedSubview(connections)
        connectionsStack.addArrangedSubview(groupAffiliation)
        connectionsStack.addArrangedSubview(relatives)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
           
        }
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        imageAndStatsStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
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
        
//        imageContentView.snp.makeConstraints { make in
//            make.top.leading.bottom.equalToSuperview()
//            make.trailing.equalTo(stats.snp.leading)
//         //   make.width.equalToSuperview().multipliedBy(0.3)
//            //make.edges.equalToSuperview()
//        }
        
//        leftSubStack.snp.makeConstraints { make in
////            make.top.leading.bottom.equalToSuperview()
////            make.width.equalToSuperview().dividedBy(0.3)
//            make.edges.equalToSuperview()
//        }
//        
        physicalInfoStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        biographyStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        workStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        connectionsStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
   
        stats.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.7)
            make.top.bottom.equalToSuperview()
          // make.height.equalTo(160)
        }
        statsStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
           // make.height.equalTo(200)
        }
        
        strength.snp.makeConstraints { make in
            make.top.equalTo(intelligence.snp.bottom)
        }
        speed.snp.makeConstraints { make in
            make.top.equalTo(strength.snp.bottom)
        }
        durability.snp.makeConstraints { make in
            make.top.equalTo(speed.snp.bottom)
        }
        power.snp.makeConstraints { make in
            make.top.equalTo(durability.snp.bottom)
        }
        combat.snp.makeConstraints { make in
            make.top.equalTo(power.snp.bottom)
        }
        
     
        physicalInfo.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
        }
        gender.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
        }
        race.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
        }
        height.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
        }
        weight.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
        }
        eyeColor.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
        }
        hairColor.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
        }
        
        biography.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
        }
        fullName.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
        }
        alterEgos.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
        }
        aliases.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
        }
        placeOfBirth.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
        }
        firstAppearance.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
        }
        publisher.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
        }
        aligned.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
        }
        
        work.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
        }
        occupation.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
        }
        base.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
        }
        
        connections.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
        }
        
        groupAffiliation.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
        }
        relatives.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
        }
        
        
    }
}
