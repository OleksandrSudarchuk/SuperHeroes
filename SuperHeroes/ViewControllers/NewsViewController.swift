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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.backgroundColor = .blue
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 170
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
}
