//
//  TableNewsRouter.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 03.02.2023.
//

import UIKit

protocol TableNewsRouterProtocol: AnyObject {
    func openNews(for news: NewsData)
}

class TableNewsRouter: TableNewsRouterProtocol{
    
    weak var view: TableNewsViewController?
    
    func openNews(for news: NewsData) {
        let vc = NewsInformationAssembly.configure(news: news)
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
