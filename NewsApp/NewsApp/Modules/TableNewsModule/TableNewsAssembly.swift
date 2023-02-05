//
//  TableNewsAssembly.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 03.02.2023.
//
import UIKit

class TableNewsAssembly{
   
    static func configure() -> UIViewController {
        let interactor = TableNewsInteractor()
        let router = TableNewsRouter()
        let presenter = TableNewsPresenter(router: router, interactor: interactor)
        let view = TableNewsViewController()
        
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}
