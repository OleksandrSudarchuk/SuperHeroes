//
//  DetailNewsViewController.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 23/08/2025.
//

import UIKit

class DetailNewsViewController: UIViewController {
    
    //MARK: - Variables
    var news: NewsItem?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mediumGray
        configureNews()
    }
    
    override func loadView() {
        view = newsView
    }
    
    //MARK: - UI Components
    let newsView = NewsView()
    
    //MARK: - Functions
    func configureNews() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        formatter.locale = Locale(identifier: "en_US")
        
        if let data = news?.pubData {
            newsView.dateLabel.text = formatter.string(from: data)
        } else {
            newsView.dateLabel.text = ""
        }
        newsView.titleLabel.text = news?.title
        newsView.descriptionLabel.text = news?.description
        
        if let urlString =  news?.imageURL, let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data {
                    DispatchQueue.main.async {
                        self.newsView.image.image = UIImage(data: data)
                    }
                }
            }.resume()
            
        } else {
            self.newsView.image.image = UIImage(systemName: "photo")
        }
    }
}
