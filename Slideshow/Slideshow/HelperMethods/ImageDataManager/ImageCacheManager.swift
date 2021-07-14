//
//  ImageCacheManager.swift
//  Slideshow
//
//  Created by Ashutosh Pandey on 04/07/21.
//

import Foundation
import UIKit


typealias ImageFetchResponseHandler = (UIImage?, Error?) -> Void

// Responsibility
// 1. Cache the image
// 2. Fetch the image form the cache
var imageCache: NSCache<AnyObject, UIImage> =  NSCache<AnyObject, UIImage>()

protocol ImageLoadOutput {
    func didFetch(image: UIImage?)
    func didRecieve(error: Error?)
}

final class ImageCacheManager {
    
    var imgFetchOutput: ImageLoadOutput!
    
    convenience init(outputHandler: ImageLoadOutput) {
        self.init()
        self.imgFetchOutput = outputHandler
    }
    
    func fetchImage(key: String, onCompletion: ImageFetchResponseHandler) {
        if let image = imageCache.object(forKey: key as AnyObject) {
            onCompletion(image, nil)
        } else {
            onCompletion(nil,nil)
        }
//        imgFetchOutput.didFetch(image: image)
    }
    
    func store(image: UIImage, for key: String) {
        imageCache.setObject(image, forKey: key as AnyObject)
    }
}
