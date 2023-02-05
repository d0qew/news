//
//  CoreDataService.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 05.02.2023.
//

import UIKit
import CoreData

class CoreDataService{
    static let shared = CoreDataService()
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "NewsApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                context.rollback()
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func saveNewsToCoreData(topic: Int16, newsList: [News]) {
        let context = persistentContainer.viewContext
        for news in newsList {
            var counter = 1
            do {
                let results = try context.fetch(NewsData.fetchRequest())
                for result in results {
                    if result.url == news.url {
                        counter = 0
                        break
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
            if counter == 1 {
                let newsObject = NewsData(context: context)
                newsObject.name = news.source.name
                newsObject.title = news.title
                newsObject.url = news.url
                newsObject.descript = news.description
                newsObject.publishedAt = news.publishedAt
                newsObject.counter = 0
                newsObject.topic = topic
                
                ImageService.shared.getImage(imageURL: news.image) { imageData in
                    newsObject.imageData = imageData
                }
                saveContext()
            }
        }
    }
    
    func fetchAllNews(completion: @escaping ([NewsData]) -> Void) {
        let context = persistentContainer.viewContext
        let fetchRequest = NewsData.fetchRequest()
        do {
            let news = try context.fetch(fetchRequest)
            print(news)
            completion(news)
        } catch {
            print(error.localizedDescription)
        }
    }
}

