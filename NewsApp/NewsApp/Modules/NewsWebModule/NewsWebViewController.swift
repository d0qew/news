//
//  NewsWebViewController.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 05.02.2023.
//

import UIKit
import WebKit

protocol NewsWebViewControllerProtocol: AnyObject {
    func viewDidLoaded()
    func openWeb(request: URLRequest)
}

class NewsWebViewController: UIViewController {
    var presenter: NewsWebPresenter?

    let webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        webView.pin(to: view)
    }
}

// MARK: EXTENSION
extension NewsWebViewController: NewsWebViewControllerProtocol {
    func openWeb(request: URLRequest) {
        webView.load(request)
    }
    
    func viewDidLoaded() {
        presenter?.viewDidLoaded()
    }
    
    
}
