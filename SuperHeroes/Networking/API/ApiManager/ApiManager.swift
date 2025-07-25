//
//  ApiManager.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 08/07/2025.
//

import Foundation

enum ApiType {
    case login
    case getHeroes
  
    
    var baseURL: String {
       "https://akabab.github.io/superhero-api/api"
    }
    
    var headers: [String: String] {
        switch self {
        case .login:
            return ["authToken":"12345"]
        case .getHeroes:
            return [:]
        
        }
    }
    
        var path: String {
            switch self {
            case .login:
                return "/login"
            case .getHeroes:
                return "/all.json"
           
            }
    }
    
    var request: URLRequest {
        let url = URL(string: "\(baseURL)\(path)")!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        switch self {
        case .login:
            request.httpMethod = "POST"
        default:
            request.httpMethod = "GET"
        }
        return request
    }
}


class ApiManager {
    static let shared = ApiManager()
    
    func getHero(completion: @escaping (Hero) -> Void) {
        let request = ApiType.getHeroes.request
        let task = URLSession.shared.dataTask(with: request) { data, responce, error in
            if let data = data {
                do {
                    let hero = try JSONDecoder().decode(Hero.self, from: data)
                    DispatchQueue.main.async {
                        completion(hero)
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            } else if let error = error {
                print("Networking error: \(error)")
            }
        }
        task.resume()
    }

}
