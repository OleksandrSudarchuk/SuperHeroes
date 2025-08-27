//
//  NewsTableViewCell.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 09/07/2025.
//

import UIKit
import FeedKit
import SnapKit

class NewsTableViewCell: UITableViewCell {
    
    //MARK: - Identifier
    static let identifier = "NewsTableViewCell"
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
       // setupBorder()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Components
    
    private let containerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.darkBlack.cgColor
        view.clipsToBounds = true
        return view
    }()
    
    private let VContentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        
        return stack
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = Typography.bodyMediumSemiBold()
        label.textColor = .darkBlack
        label.backgroundColor = .lightWhite
        label.clipsToBounds = true
        
        return label
    }()
    
   
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
 
    //MARK: - Function configure
    func configure(with item: NewsItem ) {
 
        titleLabel.text = item.title
        
        
        
        if let urlString =  item.imageURL, let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data {
                    DispatchQueue.main.async {
                        self.image.image = UIImage(data: data)
                    }
                }
            }.resume()
            
        } else {
            image.image = UIImage(systemName: "photo")
        }
    }
    private func setupBorder() {
        layer.borderWidth = 2
        layer.borderColor = UIColor.darkBlack.cgColor
        clipsToBounds = true
    }
    
}

//MARK: - Extension
extension NewsTableViewCell {
    func setUpUI() {
        addSubview(containerView)
        containerView.addSubview(image)
        containerView.addSubview(titleLabel)
        
        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.top.bottom.equalToSuperview().inset(4)
        }
        
        image.snp.makeConstraints { make in
            make.edges.equalTo(containerView.snp.edges)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(containerView)
        }
        
    }
    
}
