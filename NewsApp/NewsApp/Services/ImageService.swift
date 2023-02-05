//
//  ImageService.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 03.02.2023.
//

import UIKit

class ImageService {
    static let shared = ImageService()
    func getImage(imageURL: String, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: imageURL)
        else {
            return
        }
        let request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                return
            }
            guard let image = UIImage(data: data) else {
                return
            }
            let imageData = image.pngData()
            completion(imageData!)
        }.resume()
    }
}

