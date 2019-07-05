//
//  NetworkManager.swift
//  Cocktail Club
//
//  Created by Michael Tseitlin on 7/4/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

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
            
            do {
              let json = try JSONDecoder().decode(T.self, from: data)
                completion(json)
            } catch let error {
                print("Catch: ", error.localizedDescription)
                completion(nil)
            }
            
        }.resume()
        
    }
    
    func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let data = data, let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                completion(image)
            }
            
        }.resume()
    }
}
