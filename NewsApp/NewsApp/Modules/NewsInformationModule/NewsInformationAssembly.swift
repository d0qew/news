//
//  NewsInformationAssembly.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 03.02.2023.
//

import UIKit

class NewsInformationAssembly{
   
    static func configure(news: NewsData) -> UIViewController {
        let interactor = NewsInformationInteractor(news: news)
        let router = NewsInformationRouter()
        let presenter = NewsInformationPresenter(router: router, interactor: interactor)
        let view = NewsInformationViewController()
        
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}
