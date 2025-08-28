//
//  RegisterView.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 20/08/2025.
//

import UIKit
import SnapKit

class RegisterView: UIView {
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Components
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        return stackView
    }()
    
    private let textFieldStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        
        return stack
    }()
    
    private let headerView = AuthHeaderView(title: "Sing up", subTitle: "Enter your email and create password")
    
    private let userNameLabel = CustomAuthLabel(labelStyle: .userName)
    
    let userNameTextField = CustomTextField(fieldType: .userName)
    
    private let emailLabel = CustomAuthLabel(labelStyle: .email)
    
    let emailTextField = CustomTextField(fieldType: .email)
    
    private let passwordLabel = CustomAuthLabel(labelStyle: .password)
    
    let passwordTextField = CustomTextField(fieldType: .password)
    
    private let singinStackView: UIStackView = {
        let spacer = UIView()
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        spacer.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        let stack = UIStackView(arrangedSubviews: [spacer])
        stack.axis = .horizontal
        
        return stack
    }()
    
    let singinButton = CustomButton(title: "Already have an account? Sing In", fontSize: .small)
    
    private let buttonStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        
        return stack
    }()
    
    let singupButton = CustomButton(title: "sing up", fontSize: .main)
    
    private let separatorView = CustomOrSeparatorView()
    
    let singupGoogleButton = CustomButton(title: "sing up with google", fontSize: .google)
    
    let termTextView: UITextView = {
        let attributedString = NSMutableAttributedString(string: "By creating an account, you agree to our Terms & Conditions and acknowledge that you have read our Privacy Policy")
        attributedString.addAttribute(.link, value: "https://policies.google.com/terms?hl=en-US", range: (attributedString.string as NSString).range(of: "Terms & Conditions"))
        attributedString.addAttribute(.link, value: "https://policies.google.com/privacy?hl=en-US", range:(attributedString.string as NSString).range(of: "Privacy Policy"))
        let textView = UITextView()
        textView.linkTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.primaryBlue]
        textView.attributedText = attributedString
        textView.backgroundColor = .clear
        textView.textColor = .darkBlack
        textView.font = Typography.bodyMediumRegular()
        textView.textAlignment = .center
        textView.isSelectable = true
        textView.delaysContentTouches = false
        textView.isScrollEnabled = false
        textView.isEditable = false
        
        return textView
    }()
    
    private let buttomSpacer: UIView = {
        let view = UIView()
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        
        return view
    }()
    
}
//MARK: - Extenstion: SetupUI
extension RegisterView {
    func setupUI() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(headerView)
        mainStackView.addArrangedSubview(textFieldStackView)
        textFieldStackView.addArrangedSubview(userNameLabel)
        textFieldStackView.addArrangedSubview(userNameTextField)
        textFieldStackView.addArrangedSubview(emailLabel)
        textFieldStackView.addArrangedSubview(emailTextField)
        textFieldStackView.addArrangedSubview(passwordLabel)
        textFieldStackView.addArrangedSubview(passwordTextField)
        textFieldStackView.addArrangedSubview(singinStackView)
        singinStackView.addArrangedSubview(singinButton)
        mainStackView.addArrangedSubview(buttonStackView)
        buttonStackView.addArrangedSubview(singupButton)
        buttonStackView.addArrangedSubview(separatorView)
        buttonStackView.addArrangedSubview(singupGoogleButton)
        buttonStackView.addArrangedSubview(termTextView)
        mainStackView.addArrangedSubview(buttomSpacer)
        
        mainStackView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
        
        headerView.snp.makeConstraints { make in
            make.height.equalTo(220)
        }
        
        textFieldStackView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(16)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        
        userNameTextField.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(41)
        }
        
        textFieldStackView.setCustomSpacing(16, after: userNameTextField)
        emailLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(41)
        }
        
        textFieldStackView.setCustomSpacing(16, after: emailTextField)
        passwordLabel.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(41)
        }
        
        textFieldStackView.setCustomSpacing(16, after: passwordTextField)
        singinButton.snp.makeConstraints { make in
            make.height.equalTo(22)
        }
        
        mainStackView.setCustomSpacing(16, after: textFieldStackView)
        buttonStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        singupButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(46)
        }
        
        separatorView.snp.makeConstraints { make in
            make.height.equalTo(22)
            make.leading.trailing.equalToSuperview().inset(32)
            make.centerX.equalToSuperview()
        }
        
        singupGoogleButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}
