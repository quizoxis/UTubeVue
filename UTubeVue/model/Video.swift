//
//  Video.swift
//  UTubeVue
//
//  Created by Jamshed Qureshi on 2021-03-15.
//

import Foundation

struct Video : Decodable {
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    
    enum codingKeys : String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: codingKeys.self)
        let snippetContainer = try container.nestedContainer(keyedBy: codingKeys.self, forKey: .snippet)
        
        // get title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // get description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // get published date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        
        // thubnails
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: codingKeys.self, forKey: .thumbnails)
        
        let highThumbnailContainer = try thumbnailContainer.nestedContainer(keyedBy: codingKeys.self, forKey: .high)
        self.thumbnail = try highThumbnailContainer.decode(String.self, forKey: .thumbnail)
        
        // Video Resource ID
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: codingKeys.self, forKey: .resourceId)
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }

}
