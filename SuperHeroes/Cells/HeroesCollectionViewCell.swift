//
//  HeroesCollectionViewCell.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 08/07/2025.
//

import UIKit
import SnapKit
import SDWebImage

class HeroesCollectionViewCell: UICollectionViewCell {
    //MARK: - Identifier
    static let identifier = "HeroesCollectionViewCell"
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupUI()
        setupBorder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Components
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.lightGray.withAlphaComponent(0.8)
        label.textColor = .black
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.numberOfLines = 0
        label.font = Typography.bodyMediumSemiBold()
        label.textAlignment = .center
        return label
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .systemBackground
        return image
    }()
    
    
    //MARK: - Functions
    private func loadImage(from url: URL, into image: UIImageView) {
        URLSession.shared.dataTask(with: url) { data, responce, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
        .resume()
    }
    
    func configure(with urlString: String?, heroName: String) {
        if let urlString = urlString, let url = URL(string: urlString) {
            imageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: "person"))
        } else {
            imageView.image = UIImage(systemName: "person")
        }
        
        nameLabel.text = heroName
    }
    private func setupBorder() {
        layer.borderWidth = 2
        layer.borderColor = UIColor.darkBlack.cgColor
        clipsToBounds = true
    }
}

//MARK: - Extention with set up UI

extension HeroesCollectionViewCell {
    func setupUI() {
        
        addSubview(imageView)
        addSubview(nameLabel)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }
    }
}
