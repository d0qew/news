//
//  NewsWebRouter.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 05.02.2023.
//

import Foundation

protocol NewsWebRouterProtocol: AnyObject {
    
}

class NewsWebRouter: NewsWebRouterProtocol{
    
    
    weak var view: NewsWebViewControllerProtocol?
}
