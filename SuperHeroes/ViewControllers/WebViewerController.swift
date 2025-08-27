//
//  WebViewerController.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 16/08/2025.
//

import UIKit
import WebKit
import SnapKit

class WebViewerController: UIViewController {
    
    //MARK: - Variables
    
    private let urlString: String
    
    //MARK: - LifeCycle
    init(urlString: String) {
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDone))
        
        guard let url = URL(string: self.urlString) else { self.dismiss(animated: true, completion: nil)
            return }
        
        webView.load(URLRequest(url: url))
    }
    
    //MARK: - UI Components
    private let webView = WKWebView()
    
    //MARK: - Selectors
    @objc func didTapDone() {
        self.dismiss(animated: true, completion: nil)
    }
}
//MARK: - Extentions
extension WebViewerController {
    func setupUI() {
        view.addSubview(webView)
        
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
