//
//  NewsWebPresenter.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 05.02.2023.
//

import Foundation

protocol NewsWebPresenterProtocol: AnyObject {
    func viewDidLoaded()
    func createWeb(request: URLRequest)
}

class NewsWebPresenter{
    weak var view: NewsWebViewControllerProtocol?
    var router: NewsWebRouterProtocol
    var interactor: NewsWebInteractorProtocol
    
    
    init(router: NewsWebRouterProtocol, interactor: NewsWebInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

// MARK: EXTENSION
extension NewsWebPresenter: NewsWebPresenterProtocol {
    func createWeb(request: URLRequest) {
        view?.openWeb(request: request)
    }
    
    func viewDidLoaded() {
        interactor.getWeb()
    }
    
    
}
