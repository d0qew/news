//
//  NewsWebInteractor.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 05.02.2023.
//

import Foundation

protocol NewsWebInteractorProtocol: AnyObject{
    func getWeb()
}

class NewsWebInteractor {
    weak var presenter: NewsWebPresenterProtocol?
    let url: String
   
    init(url: String) {
        self.url = url
    }
}

// MARK: EXTENSION
extension NewsWebInteractor: NewsWebInteractorProtocol {
    
    func getWeb() {
        if let urlWeb = URL(string: url) {
            let request = URLRequest(url: urlWeb)
            presenter?.createWeb(request: request)
        }
    }
}
