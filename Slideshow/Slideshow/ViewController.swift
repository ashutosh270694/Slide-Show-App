//
//  ViewController.swift
//  Slideshow
//
//  Created by Ashutosh Pandey on 27/06/21.
//

import UIKit

class ViewController: UIViewController {
        
    var photos: [Photo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            NetworkManager().fetchData { photoResponse, error in
                
                guard error == nil else {
                    print(error?.localizedDescription)
                    return
                }
                
                DispatchQueue.main.async {
                    self.photos = photoResponse?.photos.photo ?? []
                    self.fetchFirstThreeImages()
                }
            }
        }
    }
    
    func fetchFirstThreeImages() {
        let group = DispatchGroup()
        for i in 0..<3 {
            let url =
            group.enter()
            NetworkManager().downloadImage(url: photos[i].urlN) { [weak self] image in
                self?.photos[i].image = image
                print("Downloaded \(i) Image")
                group.leave()
            }
        }
        
        group.notify(queue: DispatchQueue.main) {
            print("All the images downloaded")
        }
    }
}
