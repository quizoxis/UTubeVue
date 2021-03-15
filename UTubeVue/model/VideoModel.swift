//
//  VideoModel.swift
//  UTubeVue
//
//  Created by Jamshed Qureshi on 2021-03-15.
//

import Foundation

class VideoModel {
    
    func getVideoList()
        {
            let session = URLSession.shared
            let url = URL(string: Constants.API_URL)!
            
            let task = session.dataTask(with: url) { data, response, error in
                
                if error != nil || data == nil {
                    print("Client error!")
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    print("Server error!")
                    return
                }
                
                guard let mime = response.mimeType, mime == "application/json" else {
                    print("Wrong MIME type!")
                    return
                }
                
                // Decode data
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    let response = try decoder.decode(VideoApiResponse.self, from: data!)
                    
                    dump(response)
                    
                } catch {
                    print("JSON error: \(error.localizedDescription)")
                }
                
                
                
            }
            task.resume()
    }
}
