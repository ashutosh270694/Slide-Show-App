//
//  ImageDownloadManager.swift
//  Slideshow
//
//  Created by Ashutosh Pandey on 04/07/21.
//

import Foundation



final class ImageDownloadManager {
    
//    var imageLoadOutput: ImageCacheOutput!
    
//    convenience init(output: ImageCacheOutput) {
//        self.init()
//
//        self.imageLoadOutput = output
//    }
    
    func fetchImage(from url: String, onCompletion: @escaping ImageFetchResponseHandler) {
        
        NetworkManager().downloadImage(url: url) { image in
            
            if let image = image {
                // Store the image back to cache
                ImageCacheManager().store(image: image, for: url)

                onCompletion(image, nil)
                
//                self?.imageLoadOutput.didFetch(image: image)
//                self?.imageLoadOutput.didRecieve(error: nil)
                
            } else {
                onCompletion(nil, nil)
//                self?.imageLoadOutput.didFetch(image: nil)
//                self?.imageLoadOutput.didRecieve(error: NSError(domain: "ImageLoadingError", code: 600, userInfo: ["Reason":"Unable to fetch image from remote"]))
            }
        }
    }
    
}
