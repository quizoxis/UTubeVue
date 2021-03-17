//
//  ThumbnailCacheController.swift
//  UTubeVue
//

import Foundation
import CoreData

class ThumbnailCacheController {
    private var moc: NSManagedObjectContext
    
    init(moc:NSManagedObjectContext) {
        self.moc = moc
        
    }
    
    func setThumbnail(url:String, data:Data?) {
        
        do {
            let newThumbnail = NSEntityDescription.insertNewObject(forEntityName: "ThumbnailCache", into: moc) as! ThumbnailCache
            
            newThumbnail.url = url
            newThumbnail.blob = data
            
            try moc.save()
            
            // Thumbnail added to cache url : \(url)
            
        } catch let error {
            print(#function, "coredata failed to set thumbnail for url : \(url) : \(error)")
        }

    }
    
    
    func getThumbnail(url:String) -> Data? {
        let fetchRequest = NSFetchRequest<ThumbnailCache>(entityName: "ThumbnailCache")
        
        let nsPredicate = NSPredicate(format: "url == %@", url)
        fetchRequest.predicate = nsPredicate
        
        do {
            let result = try moc.fetch(fetchRequest).first
            
            if (result != nil) {
                // thumbnail found, return blob data
                return result?.blob
            }
            
        }catch let error {
            print(#function, "CoreData fetchreqest failed with error : ", error.localizedDescription)
            return nil
        }
        
        // No thumbnails found for given url
        return nil
    }
    

}
