//
//  NewsData+CoreDataProperties.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 05.02.2023.
//
//

import Foundation
import CoreData


extension NewsData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsData> {
        return NSFetchRequest<NewsData>(entityName: "NewsData")
    }

    @NSManaged public var counter: Int64
    @NSManaged public var descript: String
    @NSManaged public var imageData: Data
    @NSManaged public var name: String
    @NSManaged public var publishedAt: String
    @NSManaged public var title: String
    @NSManaged public var topic: Int16
    @NSManaged public var url: String

}

extension NewsData : Identifiable {

}
