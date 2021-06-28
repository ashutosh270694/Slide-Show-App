//
//  NetworkManager.swift
//  Slideshow
//
//  Created by Ashutosh Pandey on 27/06/21.
//

import Foundation
import UIKit

enum Endpoint {
    static let getFlickrImages = "https://api.flickr.com/services/rest/?method=flickr.interestingness.getList&api_key=f5c4a71b9680b0ccb8536b42c18ff25b&format=json&extras=url_n"
}

class NetworkManager {
    
    var session = URLSession.shared
    
    init() {
        
    }
    
    private func removeJSONPadding(from data: Data) -> Data? {
        
        var jsonString = String(data: data, encoding: .utf8)
        
        var range = (jsonString as NSString?)?.range(of: "(") // Range of "("
                
        let newStartingRange = (range?.location ?? 0) + 1 // Starting range of new String
        let newLength = (jsonString?.count ?? 0) - 2 - "jsonFlickrApi".count
        range?.length = newLength
        range?.location = newStartingRange
//        range?.location = (range?.location ?? 0) + 1
        
//        (range?.length ?? 0) = (jsonString?.count ?? 0) - (range?.location ?? 0) - 2 // removes parens and trailing semicolon
        if let range = range {
            jsonString = (jsonString as NSString?)?.substring(with: range)
        }
        
        return jsonString?.data(using: .utf8)
    }
    
    func fetchData(onCompletion: ((PhotoResponse?, Error?) -> ())? ) {
        guard let flickrImageUrl = URL(string: Endpoint.getFlickrImages) else { return }
    
        var request = URLRequest(url: flickrImageUrl)
        let session = URLSession.shared
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["Content-Type":"application/json"]
        
        let task = session.dataTask(with: request) {  data, response, error in
//            guard let self = self else { return }

            guard error == nil else { return }
            
            if let data = data, let jsonData = self.removeJSONPadding(from: data) {
                
                do {
                    let photoResponse = try PhotoResponse(data: jsonData)
                    onCompletion?(photoResponse,error)
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
            
            print(response)
            
        }
        task.resume()
    }
    
    func downloadImage(from url: URL) {
        
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(url: String, onCompletion: @escaping (UIImage?) -> () ) {
        print("Download Started")
        guard let url = URL(string: url) else { return }
        
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else {
                onCompletion(nil)
                return
            }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
            onCompletion(UIImage(data: data))

        }
    }
}
