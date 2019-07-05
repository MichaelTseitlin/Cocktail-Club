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
        
        guard let url = drink?.strDrinkThumb else { return }
        
        NetworkManager.shared.fetchImage(url: url) { (image) in
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    
}
