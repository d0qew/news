//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 04.02.2023.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    var image = UIImageView()
    var title = UILabel()
    var counter = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(image)
        addSubview(title)
        addSubview(counter)
        
        configureImage()
        configureTitle()
        configureCounter()
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(news: NewsData) {
        image.image = UIImage(data: news.imageData)
        title.text = news.title
        counter.text = "Number of views: \(news.counter)"
    }
    
    func configureImage() {
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
    }
    
    func configureTitle() {
        title.numberOfLines = 0
        title.adjustsFontSizeToFitWidth = true
    }
    
    func configureCounter() {
        counter.textColor = UIColor.gray
        counter.numberOfLines = 0
        counter.adjustsFontSizeToFitWidth = true
    }
    
    func setConstraints(){
        image.translatesAutoresizingMaskIntoConstraints = false
        image.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        image.heightAnchor.constraint(equalToConstant: 80).isActive = true
        image.widthAnchor.constraint(equalTo: image.heightAnchor, multiplier: 16/9).isActive = true
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerYAnchor.constraint(equalTo: centerYAnchor, constant:  -20).isActive = true
        title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20).isActive = true
        title.heightAnchor.constraint(equalToConstant: 60).isActive = true
        title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        
        counter.translatesAutoresizingMaskIntoConstraints = false
        counter.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        counter.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20).isActive = true
        counter.heightAnchor.constraint(equalToConstant: 20).isActive = true
        counter.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
