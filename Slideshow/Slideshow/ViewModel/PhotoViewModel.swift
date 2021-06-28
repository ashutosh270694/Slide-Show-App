//
//  PhotoViewModel.swift
//  Slideshow
//
//  Created by Ashutosh Pandey on 28/06/21.
//

import Foundation

class PhotoViewModel {
    var photos: [Photo] = []
    var batchSize = 3
    var startIndex = 0
    var endIndex = 3
        
    func fetchBatchImage(startIndex: Int, endIndex: Int, onCompletion: @escaping () -> ()) {
        
        let group = DispatchGroup()
        for i in startIndex..<endIndex {
            group.enter()
            NetworkManager().downloadImage(url: photos[i].urlN) { [weak self] image in
                self?.photos[i].image = image
                print("Downloaded \(i) Image")
                group.leave()
            }
        }
        
        group.notify(queue: DispatchQueue.main) {
            print("Images Downloaded for Photos from index: \(startIndex) to \(endIndex - 1)")
            onCompletion()
        }
    }
    
    func initiateImageDownload() {
        let timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(downloadImageBatch), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @objc func downloadImageBatch() {
        fetchBatchImage(startIndex: startIndex, endIndex: endIndex) { [weak self] in
            guard let self = self else { return }
            
            self.startIndex = self.endIndex
            
            var newEndIndex = self.endIndex + self.batchSize
            if newEndIndex > self.photos.count {
                newEndIndex = self.photos.count
            }
            
            self.endIndex = newEndIndex
        }
    }
}
