//
//  Extensions+UIImageView.swift
//  Cocktail Club
//
//  Created by Michael Tseitlin on 7/5/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func cacheImage(urlString: String) {
        
        guard let url = URL(string: urlString) else { return }
        
        DispatchQueue.main.async {
            self.image = nil
        }
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            DispatchQueue.main.async {
                self.image = imageFromCache
            }
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data)
                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                self.image = imageToCache
            }
            
            }.resume()
        
    }
    
    func blurImage() {
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
}
