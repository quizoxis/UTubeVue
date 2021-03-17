//
//  ThumbnailCache+CoreDataProperties.swift
//  UTubeVue
//

import Foundation
import CoreData


extension ThumbnailCache {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ThumbnailCache> {
        return NSFetchRequest<ThumbnailCache>(entityName: "ThumbnailCache")
    }

    @NSManaged public var url: String?
    @NSManaged public var blob: Data?

}

extension ThumbnailCache : Identifiable {

}
