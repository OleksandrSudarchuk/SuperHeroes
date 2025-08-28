//
//  News.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 08/07/2025.
//

import UIKit
import SnapKit
import FeedKit

class NewsViewController: UIViewController {
    
    //MARK: - Constants and Varibles
    let tableView = UITableView()
    let nssMenager = NSSManager()
    var feedItem: [NewsItem] = []
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .mediumGray
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 220
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        Task {
            await loadFeed()
        }
    }
    override func loadView() {
        view = tableView
    }
    
    //MARK: - Functions
    private func loadFeed() async {
        let url = "https://www.comicbookmovie.com/rss/"
        let item = await nssMenager.fetchRSS(from: url)
        DispatchQueue.main.async {
            self.feedItem = item
            self.tableView.reloadData()
        }
    }
}

//MARK: - Extension
extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        feedItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else {
            fatalError("Failed to deque NewsTableViewCell in NewsViewController ")
        }
        let item = feedItem[indexPath.row]
        cell.configure(with: item)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailNewsViewController()
        let passData = feedItem[indexPath.row]
        vc.news = passData
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
