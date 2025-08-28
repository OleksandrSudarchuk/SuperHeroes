//
//  LoginView.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 20/08/2025.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .fill
        return stack
    }()
    
    //MARK: - UI Components
    let headerView = AuthHeaderView(title: "Hello", subTitle: "Enter your details or Login with google")
    
    private let textFieldStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    private let emailLabel = CustomAuthLabel(labelStyle: .email)
    
    let emailTextField = CustomTextField(fieldType: .email)
    
    private let passwordLabel = CustomAuthLabel(labelStyle: .password)
    
    let passwordTextField = CustomTextField(fieldType: .password)
    
    private let forgotPasswordStackView: UIStackView = {
        //spacer for keeping my button on right side with out conflics
        let spaser = UIView()
        spaser.setContentHuggingPriority(.defaultLow, for: .horizontal)
        spaser.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        let stack = UIStackView(arrangedSubviews: [spaser])
        stack.axis = .horizontal
        
        return stack
    }()
    
    let forgotPasswordButton = CustomButton(title: "I forgot my password", fontSize: .small)
    
    private let buttonStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    let loginButton = CustomButton(title: "log in to your account", fontSize: .main)
    
    let separateView = CustomOrSeparatorView()
    
    let loginGoogleButton = CustomButton(title: "log in with google", fontSize: .google)
    
    private let singupStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 0
        stack.alignment = .firstBaseline
        return stack
    }()
    
    private let singupLabel: UILabel = {
        let label = UILabel()
        label.text = "don't have an account?"
        label.font = Typography.bodyMediumRegular()
        label.textColor = .darkBlack
        return label
    }()
    
    let singupButton = CustomButton(title: "sing up for free", fontSize: .small)
    
    //bottom spaser for keeping fill free space and don't make conflicts
    private let bottomSpacer: UIView = {
        let view = UIView()
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return view
    }()
    
}
//MARK: - Extenstion: SetupUI
extension LoginView {
    func setupUI() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(headerView)
        mainStackView.addArrangedSubview(textFieldStackView)
        textFieldStackView.addArrangedSubview(emailLabel)
        textFieldStackView.addArrangedSubview(emailTextField)
        textFieldStackView.addArrangedSubview(passwordLabel)
        textFieldStackView.addArrangedSubview(passwordTextField)
        textFieldStackView.addArrangedSubview(forgotPasswordStackView)
        forgotPasswordStackView.addArrangedSubview(forgotPasswordButton)
        mainStackView.addArrangedSubview(buttonStackView)
        buttonStackView.addArrangedSubview(loginButton)
        buttonStackView.addArrangedSubview(separateView)
        buttonStackView.addArrangedSubview(loginGoogleButton)
        buttonStackView.addArrangedSubview(singupStackView)
        singupStackView.addArrangedSubview(singupLabel)
        singupStackView.addArrangedSubview(singupButton)
        mainStackView.addArrangedSubview(bottomSpacer)
        
        mainStackView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
        
        headerView.snp.makeConstraints { make in
            make.height.equalTo(220)
        }
        
        textFieldStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(41)
        }
        
        textFieldStackView.setCustomSpacing(16 , after: emailTextField)
        
        passwordLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(41)
        }
        
        textFieldStackView.setCustomSpacing(16, after: passwordTextField)
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.height.equalTo(22)
        }
        
        mainStackView.setCustomSpacing(16, after: textFieldStackView)
        
        buttonStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        loginButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(46)
        }
        
        separateView.snp.makeConstraints { make in
            make.width.equalTo(319)
            make.height.equalTo(22)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        loginGoogleButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
        singupStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(48)
        }
    }
}

