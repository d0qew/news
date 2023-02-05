//
//  TableNewsPresenter.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 03.02.2023.
//

import Foundation

protocol TableNewsPresenterProtocol: AnyObject {
    func viewDidLoaded()
    func refresh()
    func storedNewsLoaded(news: [NewsData])
    func showDetailsNews(for news: NewsData)}

class TableNewsPresenter {
    weak var view: TableNewsViewControllerProtocol?
    var router: TableNewsRouterProtocol
    var interactor: TableNewsInteractorProtocol
    
    
    init(router: TableNewsRouterProtocol, interactor: TableNewsInteractorProtocol) {
        self.router = router
        self.interactor = interactor
        
    }
}

// MARK: EXTENSION
extension TableNewsPresenter: TableNewsPresenterProtocol {
    func showDetailsNews(for news: NewsData) {
        router.openNews(for: news)
    }
    
    func viewDidLoaded() {
        interactor.getStoredNews()
    }
    
    func refresh() {
        interactor.getLastNews()
    }
    
    func storedNewsLoaded(news: [NewsData]) {
        view?.tableReload(news: news)
    }
}
