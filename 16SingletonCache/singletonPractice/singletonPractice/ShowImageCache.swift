//
//  ShowImageCache.swift
//  singletonPractice
//
//  Created by Julie Connors on 8/23/21.
//

import UIKit

class ShowImageCache {
    
    static let shared = ShowImageCache()
    
    private init() {}
    
    var nsCache: NSCache<NSString, UIImage> = NSCache()
    
    func findImage(imageString: String) -> UIImage? {
        let nsString = imageString as NSString
        return nsCache.object(forKey: nsString)
    }
    
    func addImage(imageString: String, image: UIImage) {
        let nsString = imageString as NSString
        nsCache.setObject(image, forKey: nsString)
    }
}
