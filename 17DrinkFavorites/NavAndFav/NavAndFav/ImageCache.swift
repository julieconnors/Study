//
//  ImageCache.swift
//  NavAndFav
//
//  Created by Julie Connors on 8/24/21.
//

import UIKit

class ImageCache {
    
    static let shared = ImageCache()
    
    private init() {}
    
    var myCache: NSCache<NSString, UIImage> = NSCache()
    
    func findImage(str: String) -> UIImage? {
        let nsImageString = str as NSString
        return myCache.object(forKey: nsImageString)
    }
    
    func addImage(str: String, image: UIImage) {
        let nsImageString = str as NSString
        myCache.setObject(image, forKey: nsImageString)
    }
}
