//
//  TableNewsViewController.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 03.02.2023.
//

import UIKit

protocol TableNewsViewControllerProtocol: AnyObject {
    func viewDidLoad()
    func tableReload(news: [NewsData])
}


class TableNewsViewController: UIViewController {
    var presenter: TableNewsPresenter?
    
    struct Cells {
        static let newsCell = "NewsTableViewCell"
    }
    var tableView = UITableView()
    var newsList = [NewsData](){
        didSet {
            tableView.reloadData()
        }
    }
    
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Новости"
        presenter?.viewDidLoaded()
        configureTableView()
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc private func refresh(sender: UIRefreshControl) {
        presenter?.refresh()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegate()
        tableView.rowHeight = 100
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: Cells.newsCell)
        //custom func pin in NewsApp/Extensions/ExtensionView
        tableView.pin(to: view)
        
    }
    private func setTableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: EXTENSION PROTOCOL
extension TableNewsViewController: TableNewsViewControllerProtocol {
    func tableReload(news: [NewsData]) {
        self.newsList = news
        DispatchQueue.main.async {
            self.refreshControl.endRefreshing()
        }
    }
}

// MARK: EXTENSION TableViewDelegate, TableViewDataSource
extension TableNewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.newsCell) as! NewsTableViewCell
        let news = newsList[indexPath.row]
        cell.set(news: news)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let news = newsList[indexPath.row]
        presenter?.showDetailsNews(for: news)
    }
}
