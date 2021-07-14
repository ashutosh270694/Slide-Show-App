//
//  PhotoViewModel.swift
//  Slideshow
//
//  Created by Ashutosh Pandey on 28/06/21.
//

import Foundation
import UIKit

protocol ImageFetchBatching {
    associatedtype Photo
    
    var maxHeight: CGFloat { get set }
    var maxWidth: CGFloat { get set }
    var batchSize: Int { get set }
    var nextBatchSize: Int { get set }
}

final class PhotoViewModel {
    
    var imageManager: ImageDataManager
    
    private var maxHeight: CGFloat = 0
    private var maxWidth: CGFloat = 0
    var photos: [Photo] = []
    var batchSize = 3
    var startIndex = 0
    var endIndex = 3
    
    private var timer: Timer?
    var didUpdateImageBatch: ((Int, Int) -> ())?
    
    init(maxSize: CGSize, imageManager: ImageDataManager) {
        self.maxHeight = maxSize.height
        self.maxWidth = maxSize.width
        self.imageManager = imageManager
    }
        
    func fetchBatchImage(startIndex: Int, endIndex: Int, onCompletion: @escaping () -> ()) {
        let group = DispatchGroup()
        for i in startIndex..<endIndex {
            group.enter()
            
            imageManager.getImage(url: self.photos[i].urlN) { _, _ in
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
    
    func getNextBatchSize() -> Int {
        var i = endIndex
        var currentSize: CGFloat = 0
        var batchSize = 0
        while CGFloat(photos[i].widthN) < maxWidth && CGFloat(photos[i].heightN) < maxHeight && i < photos.count && currentSize < maxHeight{
            currentSize += CGFloat(photos[i].heightN)
            batchSize += 1
            i += 1
        }
        
        print("Current Batch Size: \(batchSize)")
        
        return batchSize
    }
    
    @objc func downloadImageBatch() {
        guard startIndex < photos.count else {
            timer?.invalidate()
            timer = nil
            return
        }
        
        fetchBatchImage(startIndex: startIndex, endIndex: endIndex) { [weak self] in
            guard let self = self else { return }
            
            self.didUpdateImageBatch?(self.startIndex, self.endIndex)
            
            self.startIndex = self.endIndex
            
            var newEndIndex = self.endIndex + self.getNextBatchSize()
            if newEndIndex > self.photos.count {
                newEndIndex = self.photos.count
            }
            
            self.endIndex = newEndIndex
        }
    }
}
