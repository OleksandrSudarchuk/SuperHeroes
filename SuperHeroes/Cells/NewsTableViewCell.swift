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
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Components
    private let HStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
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
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
   private let image: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 9, weight: .light)
        return label
    }()
    //MARK: - Function configure
    func configure(with item: NewsItem ) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        formatter.locale = Locale(identifier: "en_US")

        if let data = item.pubData {
            dateLabel.text = formatter.string(from: data)
        } else {
            dateLabel.text = ""
        }
        titleLabel.text = item.title
        descriptionLabel.text = item.description
    
        
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
    
}

//MARK: - Extension
extension NewsTableViewCell {
    func setUpUI() {
        addSubview(HStack)
        HStack.addArrangedSubview(image)
        HStack.addArrangedSubview(VContentStack)
        VContentStack.addArrangedSubview(titleLabel)
        VContentStack.addArrangedSubview(descriptionLabel)
        VContentStack.addArrangedSubview(dateLabel)
        HStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
            
        }
        
        image.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.25)
        }
        
        VContentStack.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.equalTo(image.snp.trailing)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(8)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.trailing.leading.bottom.equalToSuperview().inset(8)
        }
    }
    
}
