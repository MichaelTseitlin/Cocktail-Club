//
//  CollectionViewController.swift
//  Cocktail Club
//
//  Created by Michael Tseitlin on 7/4/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    private var coctails: Coctail?
    private let networkDataService = NetworkDataService()
    
    // MARK: - @IBOutlets
    
    @IBOutlet var backgroundImage: UIImageView!
    
    // MARK: - UIMethods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkDataService.fetchCoctails() { (coctails) in
            self.coctails = coctails
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        backgroundImage.blurImage()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coctails?.drinks?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        let drink = coctails?.drinks?[indexPath.row]
        
        cell.config(drink: drink)
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
        let drink = coctails?.drinks?[indexPath.row]
        
        let destination = segue.destination as! DetailViewController
        destination.idDrink = drink?.idDrink ?? ""
        destination.title = drink?.strDrink
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {}
}
