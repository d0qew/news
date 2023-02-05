//
//  NewsService.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 03.02.2023.
//

import Foundation

class NewsService {
   static let shared = NewsService()
    
    func getNews(topic: String, country: String, language: String, token: String, completion: @escaping (NewsList) -> Void) {

        guard let url = URL(string: "https://gnews.io/api/v4/top-headlines?topic=\(topic)&token=\(token)&lang=\(language)&country=\(country)&max=10")
        else {
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                return
            }
            do {
                let newsInfoJSON = try JSONDecoder().decode(NewsList.self, from: data)
                completion(newsInfoJSON)
            }catch {
                print(error)
            }
        }.resume()
    }
}
