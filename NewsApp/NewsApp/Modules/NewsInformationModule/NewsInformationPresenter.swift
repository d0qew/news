//
//  NewsInformationPresenter.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 03.02.2023.
//

import Foundation

protocol NewsInformationPresenterProtocol: AnyObject {
    func viewDidLoaded()
    func newsDataLoaded(news: NewsData)
    func buttonTapped(url: String)
}

class NewsInformationPresenter {
    weak var view: NewsInformationViewControllerProtocol?
    var router: NewsInformationRouterProtocol
    var interactor: NewsInformationInteractorProtocol
    
    
    init(router: NewsInformationRouterProtocol, interactor: NewsInformationInteractorProtocol) {
        self.router = router
        self.interactor = interactor
        
    }
}

// MARK: EXTENSION
extension NewsInformationPresenter: NewsInformationPresenterProtocol {
    func buttonTapped(url: String) {
        router.openWeb(url: url)
    }

    func newsDataLoaded(news: NewsData) {
        view?.updateView(news: news)
    }
    
    func viewDidLoaded() {
        interactor.getNewsData()
    }
    
}
