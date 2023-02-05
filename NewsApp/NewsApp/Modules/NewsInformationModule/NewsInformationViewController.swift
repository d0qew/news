//
//  NewsInformationViewController.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 03.02.2023.
//

import UIKit

protocol NewsInformationViewControllerProtocol: AnyObject {
    func viewDidLoad()
    func updateView(news: NewsData)
}

class NewsInformationViewController: UIViewController {
    var presenter: NewsInformationPresenter?
    
    var titleView = UILabel()
    var titleNewsLabel = UILabel()
    var imageNews = UIImageView()
    var descriptionNews = UILabel()
    var dateNewsLabel = UILabel()
    var sourceNewsLabel = UILabel()
    var urlNewsButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        presenter?.viewDidLoaded()
    }
    
    private func setConstraints() {
        view.addSubview(titleView)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.topAnchor.constraint(equalTo: view.topAnchor, constant: StructScreenSize.shared.screenHeight/8).isActive = true
        titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleView.widthAnchor.constraint(equalToConstant: StructScreenSize.shared.screenWidth - 40).isActive = true
        
        view.addSubview(titleNewsLabel)
        titleNewsLabel.translatesAutoresizingMaskIntoConstraints = false
        titleNewsLabel.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 20).isActive = true
        titleNewsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleNewsLabel.widthAnchor.constraint(equalToConstant: StructScreenSize.shared.screenWidth - 40).isActive = true
        
        view.addSubview(imageNews)
        imageNews.translatesAutoresizingMaskIntoConstraints = false
        imageNews.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageNews.topAnchor.constraint(equalTo: titleNewsLabel.bottomAnchor, constant: 20).isActive = true
        imageNews.heightAnchor.constraint(equalToConstant: StructScreenSize.shared.screenHeight/4).isActive = true
        imageNews.widthAnchor.constraint(equalTo: imageNews.heightAnchor, multiplier: 16/9).isActive = true
        
        view.addSubview(descriptionNews)
        descriptionNews.translatesAutoresizingMaskIntoConstraints = false
        descriptionNews.topAnchor.constraint(equalTo: imageNews.bottomAnchor, constant: 20).isActive = true
        descriptionNews.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        descriptionNews.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        view.addSubview(dateNewsLabel)
        dateNewsLabel.translatesAutoresizingMaskIntoConstraints = false
        dateNewsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        dateNewsLabel.topAnchor.constraint(equalTo: descriptionNews.bottomAnchor, constant: 20).isActive = true
        dateNewsLabel.widthAnchor.constraint(equalToConstant: StructScreenSize.shared.screenWidth - 40).isActive = true
        
        view.addSubview(sourceNewsLabel)
        sourceNewsLabel.translatesAutoresizingMaskIntoConstraints = false
        sourceNewsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        sourceNewsLabel.topAnchor.constraint(equalTo: dateNewsLabel.bottomAnchor, constant: 20).isActive = true
        sourceNewsLabel.widthAnchor.constraint(equalToConstant: StructScreenSize.shared.screenWidth - 40).isActive = true
        
        view.addSubview(urlNewsButton)
        urlNewsButton.translatesAutoresizingMaskIntoConstraints = false
        urlNewsButton.topAnchor.constraint(equalTo: sourceNewsLabel.bottomAnchor, constant: 20).isActive = true
        urlNewsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        urlNewsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        urlNewsButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}

// MARK: EXTENSION
extension NewsInformationViewController: NewsInformationViewControllerProtocol {
    func updateView(news: NewsData) {
        titleView.textAlignment = .center
        titleView.font = UIFont(name: "Menlo-Bold", size: 20)
        titleView.text = "Новость"
        
        titleNewsLabel.numberOfLines = 0
        titleNewsLabel.textAlignment = .center
        titleNewsLabel.text = news.title
        
        imageNews.image = UIImage(data: news.imageData)
        
        descriptionNews.numberOfLines = 0
        descriptionNews.text = news.descript
        descriptionNews.textAlignment = .justified
        
        dateNewsLabel.text = "Дата публикации: \(news.publishedAt)"
        
        sourceNewsLabel.numberOfLines = 0
        sourceNewsLabel.text = "Источник: \(news.name)"
        
        urlNewsButton.setTitle(news.url, for: .normal)
        urlNewsButton.setTitleColor(.blue, for: .normal)
        urlNewsButton.setTitleColor(.gray, for: .selected)
        urlNewsButton.titleLabel?.numberOfLines = 0
        urlNewsButton.backgroundColor = .clear
        urlNewsButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        setConstraints()
    }
    @objc func tapButton(){
        presenter?.buttonTapped(url: urlNewsButton.titleLabel?.text ?? "https://www.google.com/")
    }
}
