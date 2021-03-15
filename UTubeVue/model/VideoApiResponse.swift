//
//  Response.swift
//  UTubeVue
//
//  Created by Jamshed Qureshi on 2021-03-15.
//

import Foundation

struct VideoApiResponse : Decodable {
    
    var items : [Video]?
    
    enum codingKeys : String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: codingKeys.self)
        self.items = try container.decode([Video].self, forKey: .items)
        
    }
}

