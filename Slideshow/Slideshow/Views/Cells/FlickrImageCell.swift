//
//  FlickrImageCell.swift
//  Slideshow
//
//  Created by Ashutosh Pandey on 28/06/21.
//

import UIKit


class FlickrImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func prepareForReuse() {
        imgView.image = nil
    }
     
    func configureCell(photo: Photo) {
        imgView.setImage(url: photo.urlN)
        
//        photo.setupDidUpdateImage { [weak self] image in
//            DispatchQueue.main.async {
//                self?.imgView.image = image
//            }
//        }
    }
}

