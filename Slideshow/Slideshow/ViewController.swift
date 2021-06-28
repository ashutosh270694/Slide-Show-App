//
//  ViewController.swift
//  Slideshow
//
//  Created by Ashutosh Pandey on 27/06/21.
//

import UIKit

class ViewController: UIViewController {
   
    
        
    @IBOutlet weak var collectionView: UICollectionView!
    
//    var photos: [Photo] = []
    
    var startingBatchIndex = 0
    var photoViewModel = PhotoViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        photoViewModel.delegate = self
        setupAndTriggerImageDownload()
    }
    
    // MARK: Setup Methods
    func setupAndTriggerImageDownload() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            NetworkManager().fetchData { photoResponse, error in
                
                guard error == nil else {
                    print(error?.localizedDescription)
                    return
                }
                
                DispatchQueue.main.async {
                    self.photoViewModel.photos = photoResponse?.photos.photo ?? []
//                    self.collectionView.performBatchUpdates {
                        self.collectionView.reloadData()
//                    } completion: { isCollectionViewUpdated in
                        // Do nothing
                        self.photoViewModel.initiateImageDownload()
//                    }
                }
            }
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoViewModel.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FlickrImageCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        
        cell.configureCell(photo: photoViewModel.photos[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let photo = photoViewModel.photos[indexPath.item]
        return CGSize(width: photo.widthN, height: photo.heightN)
    }
    
}

extension ViewController: PhotoDownloadDelegate {
    
    func didDownloadImages(from startIndex: Int, endIndex: Int) {
         
    }
}
