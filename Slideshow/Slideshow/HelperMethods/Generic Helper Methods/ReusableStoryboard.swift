//
//  ReusableStoryboard.swift
//  Ashutosh Pandey
//
//  Created by Ashutosh Pandey on 16/03/21.
//  Copyright © 2021 RoppenLabs. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboardable: class {
    static var storyboardIdentifier: String { get }
}

extension Storyboardable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

extension UIViewController: Storyboardable { }

// Short form of storyboard
enum SB: String {
    case main = "Main"
    case settings = "Settings"

    func instantiateVC<T: UIViewController>() -> T {
        guard let vc = UIStoryboard(name: self.rawValue, bundle: nil).instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Could not instantiate initial storyboard with name: \(T.storyboardIdentifier)")
        }
        
        return vc
    }
}
