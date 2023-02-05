//
//  NewsWebAssembly.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 05.02.2023.
//

import UIKit

class NewsWebAssembly{
   
    static func configure(url: String) -> UIViewController {
        let interactor = NewsWebInteractor(url: url)
        let router = NewsWebRouter()
        let presenter = NewsWebPresenter(router: router, interactor: interactor)
        let view = NewsWebViewController()
        
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}
