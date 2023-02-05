//
//  TableNewsInteractor.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 03.02.2023.
//

import Foundation

protocol TableNewsInteractorProtocol: AnyObject{
    func getLastNews()
    func getStoredNews()
}

class TableNewsInteractor {
    weak var presenter: TableNewsPresenterProtocol?
    
}

// MARK: EXTENSION
extension TableNewsInteractor: TableNewsInteractorProtocol {
    func getStoredNews() {
        DispatchQueue.main.async {
            CoreDataService.shared.fetchAllNews { news in
                self.presenter?.storedNewsLoaded(news: news)
            }
        }
    }
    
    func getLastNews() {
        DispatchQueue.main.async {
            NewsService().getNews(topic: "world",
                                  country: "ru",
                                  language: "ru",
                                  token: "bc63e7cb7082b8fdec12157430c69daf") {news in
                //save topics:
                // 0 - breaking-news
                // 1 - world
                // 2 - business
                // 3 - sports
                // 4 - health
                CoreDataService.shared.saveNewsToCoreData(topic: 1, newsList: news.articles)
            }
        }
        self.getStoredNews()
    }
}

