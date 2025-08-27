//
//  ForgotView.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 20/08/2025.
//

import UIKit
import SnapKit

class ForgotView: UIView {
    
    //MARK: - Init
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - UI Components
    private let mainStackview: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 8
        
        return stack
    }()
   private let headerView = AuthHeaderView(title: "Forgot Password?", subTitle: "We will send a password reminder to the email address you use to log in")
    private let subStackview: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    private let emailLabel = CustomAuthLabel(labelStyle: .email)
    let emailTextField = CustomTextField(fieldType: .email)
    let sendButton = CustomButton(title: "send email with instruction", fontSize: .main)
    private let buttomSpacerView: UIView = {
        let view = UIView()
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return view
    }()
    
}
//MARK: - Extentions: set up UI
extension ForgotView {
    func setupUI() {
        addSubview(mainStackview)
        mainStackview.addArrangedSubview(headerView)
        mainStackview.addArrangedSubview(subStackview)
        subStackview.addArrangedSubview(emailLabel)
        subStackview.addArrangedSubview(emailTextField)
        subStackview.addArrangedSubview(sendButton)
        mainStackview.addArrangedSubview(buttomSpacerView)
        
        
        mainStackview.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(150)
        }
        headerView.snp.makeConstraints { make in
            make.height.equalTo(220)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        subStackview.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        emailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(41)
        }
        subStackview.setCustomSpacing(32, after: emailTextField)
        sendButton.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(46)
        }
        
        
    }
}

