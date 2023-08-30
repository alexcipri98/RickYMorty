//
//  ImageCache.swift
//  ZaraRickYMorty
//
//  Created by Alex Ciprián López on 30/8/23.
//

import Foundation
import SwiftUI

class ImageCache {
    static let shared = ImageCache()
    
    private var cache: NSCache<NSString, UIImage>
    
    private init() {
        cache = NSCache<NSString, UIImage>()
    }
    
    func getImage(for url: URL) -> UIImage? {
        let key = url.absoluteString as NSString
        return cache.object(forKey: key)
    }
    
    func setImage(_ image: UIImage?, for url: URL) {
        let key = url.absoluteString as NSString
        if let image = image {
            cache.setObject(image, forKey: key)
        } else {
            cache.removeObject(forKey: key)
        }
    }
}
