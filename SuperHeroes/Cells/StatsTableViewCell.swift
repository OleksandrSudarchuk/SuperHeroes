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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - UI Components
    private let imageOfHero: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    func loadImage(with url: URL, into image: UIImageView) {
        URLSession.shared.dataTask(with: url) { data, responce, error in
            guard let data = data, error == nil  else {return}
            DispatchQueue.main.async {
                self.imageOfHero.image = UIImage(data: data)
            }
            
            
        }
    }
    func configure(with stats: Hero,) {
        
    }
    
}
