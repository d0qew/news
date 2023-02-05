//
//  NewsInformationRouter.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 03.02.2023.
//

import Foundation

protocol NewsInformationRouterProtocol: AnyObject {
    func openWeb(url: String)
}

class NewsInformationRouter: NewsInformationRouterProtocol{

    weak var view: NewsInformationViewController?
    
    func openWeb(url: String) {
        let vc = NewsWebAssembly.configure(url: url)
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
