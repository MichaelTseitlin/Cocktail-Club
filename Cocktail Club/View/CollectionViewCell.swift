//
//  CollectionViewCell.swift
//  Cocktail Club
//
//  Created by Michael Tseitlin on 7/4/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    func config(drink: Drink?) {
        
        nameLabel.text = drink?.strDrink
        
        guard let urlString = drink?.strDrinkThumb else { return }
        
        NetworkManager.shared.fetchImage(urlString: urlString) { (image) in
            self.imageView.image = image
        }
//        imageView.cacheImage(urlString: urlString)
    }
    
}
