//
//  NetworkManager.swift
//  Cocktail Club
//
//  Created by Michael Tseitlin on 7/4/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class NetworkManager {
    
    static let shared = NetworkManager()

    private init() {}
    
    func fetchData<T: Codable>(url: String, completion: @escaping (T?) -> Void) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            
            guard let data = data else { return }
            
            let json = try? JSONDecoder().decode(T.self, from: data)
            completion(json)
            
        }.resume()
        
    }
    
    func fetchImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        DispatchQueue.main.async {
            completion(nil)
        }
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            DispatchQueue.main.async {
                completion(imageFromCache)
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
                completion(imageToCache)
            }
            
        }.resume()
    }
}
