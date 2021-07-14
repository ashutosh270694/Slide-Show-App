//
//  ImageDataManager.swift
//  Slideshow
//
//  Created by Ashutosh Pandey on 04/07/21.
//

import Foundation
import UIKit

final class ImageDataManager {
    
//    var didRecieveImage: ImageFetchResponseHandler
    
//    var handle: DefaultImageLoadOutput!
    private var imageCache: ImageCacheManager!
    private var networkImageDownloader: ImageDownloadManager!
    
    init() {
        imageCache = ImageCacheManager()
        networkImageDownloader = ImageDownloadManager()
    }
    
//    convenience init(handler: ((UIImage?, Error?) -> Void)) {
//        self.init()
//
//        setupImageCache()
//
//
////        self.handle = DefaultImageLoadOutput(handler: @escaping { image, error in
////            // By default load from cache if available
////            handler(image, error)
////        })
//    }
    
    func getImage(url: String, onCompletion: @escaping ImageFetchResponseHandler) {
        imageCache.fetchImage(key: url) { image, error in
            if let image = image {
                onCompletion(image,nil)
                
            } else {
                // Download the image from network if the image is unavailable in the cache
                networkImageDownloader.fetchImage(from: url) { downloadedImage, error in
                    guard error == nil else {
                        onCompletion(nil, error)
                        return
                    }
                    
                    onCompletion(downloadedImage, error)
                }
            }
        }
    }
    
//    func setupImageCache() {
//        var cacheImageOutput: ImageLoadOutput = DefaultImageLoadOutput { image, error in
//            if let image = image {
//    
//            } else {
//                // Handler specific errors from cache here
//                if error != nil {
//                    
//                    
//                }
//            }
//        }
//        
//        imageCache = ImageCacheManager(outputHandler: cacheImageOutput)
//    }
}
