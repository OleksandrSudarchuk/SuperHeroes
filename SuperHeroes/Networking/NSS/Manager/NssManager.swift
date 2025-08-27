//
//  NssManager.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 09/07/2025.
//

import UIKit
import FeedKit

import SDWebImage

class NSSManager {
    func fetchRSS(from urlString: String) async -> [NewsItem] {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return []
        }
        do {
            let feed =  try await RSSFeed(url: url)
            
            let item: [NewsItem] = feed.channel?.items?.compactMap { item in
                let imageFromEnclosure = item.enclosure?.attributes?.url
                let imageFromITunes = item.iTunes?.image?.attributes?.href
                let imageFromMedia = item.media?.contents?.first?.attributes?.url
                
                let imageURL = imageFromEnclosure ?? imageFromITunes ?? imageFromMedia
                
                return  NewsItem(title: item.title ?? "NO Title",
                                 description: item.description ?? "NO Description",
                                 pubData: item.pubDate , link: item.link ?? "No link",
                                 imageURL:imageURL
                )
            } ?? []
            return item
        } catch {
            print("Error parsing RSS: \(error)")
            return []
        }
    }
}
