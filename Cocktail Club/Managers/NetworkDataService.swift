//
//  NetworkDataService.swift
//  Cocktail Club
//
//  Created by Michael Tseitlin on 7/4/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import Foundation

class NetworkDataService {
    
    let networkManager = NetworkManager.shared
    
    func fetchCoctails(completion: @escaping (Coctail?) -> Void) {
        let url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail"
        networkManager.fetchData(url: url, completion: completion)
    }
    
    func fetchDrink(byId: String, completion: @escaping (Coctail?) -> Void) {
        let url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(byId)"
        networkManager.fetchData(url: url, completion: completion)
    }
    
}
