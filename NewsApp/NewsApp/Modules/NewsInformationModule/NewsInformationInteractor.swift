//
//  NewsInformationInteractor.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 03.02.2023.
//

import Foundation

protocol NewsInformationInteractorProtocol: AnyObject{
    func getNewsData()
}

class NewsInformationInteractor {
    weak var presenter: NewsInformationPresenterProtocol?
    let news: NewsData
    
    init(news: NewsData) {
        self.news = news
    }
}

// MARK: EXTENSION
extension NewsInformationInteractor: NewsInformationInteractorProtocol {
    func getNewsData() {
        presenter?.newsDataLoaded(news: news)
    }
}
