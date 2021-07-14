//
//  UIImage+AsynchronousOperation.swift
//  Slideshow
//
//  Created by Ashutosh Pandey on 04/07/21.
//

import Foundation
import UIKit

class DefaultImageLoadOutput: ImageLoadOutput {
    
    var didFetchImage: ((UIImage?, Error?) -> ())!
    
    convenience init(handler: @escaping (UIImage?, Error?) -> ()) {
        self.init()
        
        didFetchImage = handler
    }
    
    func didFetch(image: UIImage?) {
        didFetchImage?(image,nil)
    }
    
    func didRecieve(error: Error?) {
        didFetchImage?(nil, error)
    }
}

extension UIImageView {
    
    func setImage(url: String, onCompletion: ((UIImage?, Error?) -> Void)? = nil ) {
        
        let imageDataManager = ImageDataManager()
        imageDataManager.getImage(url: url) { image, error in
            DispatchQueue.main.async {
                self.image = image
            }
            debugPrint(error)
        }
        
    }
    
    private func handleFetched(image: UIImage?, error: Error?) {
        guard error == nil else {
            debugPrint("Unable to fetch image")
            return
        }
        
        self.image = image

    }
    
}
