//
//  NewsListStructDecode.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 03.02.2023.
//

import Foundation

struct NewsList: Decodable {
    let articles: [News]
}

struct News: Decodable {
    let title: String
    let description: String
    let url: String
    let image: String
    let publishedAt: String
    let source: Source
}

struct Source: Decodable {
    let name: String
}
