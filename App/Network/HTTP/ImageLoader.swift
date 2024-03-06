//
//  ImageLoader.swift
//  App
//
//  Created by ios Dev on 05/03/2024.
//

import UIKit

class ImageLoader {
    
    static let shared = ImageLoader()
    private let cache = NSCache<NSString, UIImage>()
    
    func loadImage(from url: URL) async throws -> UIImage {
        if let cachedImage = cache.object(forKey: url.absoluteString as NSString) {
            return cachedImage
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let image = UIImage(data: data) else {
            throw ImageLoadingError.invalidData
        }
        
        cache.setObject(image, forKey: url.absoluteString as NSString)
        return image
    }
}

enum ImageLoadingError: Error {
    case invalidData
}
