//
//  NewsView.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 23/08/2025.
//

import UIKit

class NewsView: UIView {
   
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
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
        view.backgroundColor = .lightWhite
        
        return view
    }()
    private let separator = CustomSeparatorView()
    private let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()
    private let mainTitle: UILabel = {
        let label = UILabel()
        label.text = "Superhero Today"
        label.font = Typography.heading1()
        label.textAlignment = .center
        label.textColor = .darkBlack
        
        return label
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = Typography.heading2()
        label.textColor = .darkBlack
        
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = Typography.bodyLargeRegular()
        
        return label
    }()
    
    
    let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = Typography.bodyLargeRegular()
        return label
    }()
   
    private let bottomSpacer: UIView = {
        let view = UIView()
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return view
    }()
    
    //MARK: - Variable and Constant
    //MARK: - Functions


}
//MARK: - Extension
extension NewsView {
    func setupUI() {
        addSubview(containerView)
        containerView.addSubview(mainStack)
        mainStack.addArrangedSubview(mainTitle)
        mainStack.addArrangedSubview(separator)
        mainStack.addArrangedSubview(titleLabel)
        mainStack.addArrangedSubview(image)
        mainStack.addArrangedSubview(descriptionLabel)
        mainStack.addArrangedSubview(dateLabel)
        mainStack.addArrangedSubview(bottomSpacer)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        mainStack.snp.makeConstraints { make in
            make.edges.edges.equalToSuperview()
        }
        mainTitle.snp.makeConstraints { make in            make.trailing.leading.equalToSuperview().inset(8)
            make.top.equalToSuperview().inset(16)
        }
        separator.snp.makeConstraints { make in
            make.top.equalTo(mainTitle.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(22)
        }
        titleLabel.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
            make.top.equalTo(separator.snp.bottom).offset(16)
        }
        image.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
           make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.height.equalTo(200)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
            make.top.equalTo(image.snp.bottom).offset(32)
        }
        dateLabel.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(8)
           make.top.equalTo(descriptionLabel.snp.bottom).offset(16)
          //  make.bottom.equalToSuperview()
        }
        
    }
}
