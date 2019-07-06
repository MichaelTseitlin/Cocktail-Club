//
//  DetailViewController.swift
//  Cocktail Club
//
//  Created by Michael Tseitlin on 7/4/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var idDrink = ""
    var drink: Drink?
    private let networkDataService = NetworkDataService()
    
    // MARK: - @IBOutlets
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var alcoholicLabel: UILabel!
    @IBOutlet var glassLabel: UILabel!
    @IBOutlet var instructionLabel: UILabel!
    @IBOutlet var backgroundImage: UIImageView!
    
    @IBOutlet var ingredients1Label: UILabel!
    @IBOutlet var ingredients2Label: UILabel!
    @IBOutlet var ingredients3Label: UILabel!
    @IBOutlet var ingredients4Label: UILabel!
    @IBOutlet var ingredients5Label: UILabel!
    @IBOutlet var ingredients6Label: UILabel!
    @IBOutlet var ingredients7Label: UILabel!
    @IBOutlet var ingredients8Label: UILabel!
    
    @IBOutlet var measure1Label: UILabel!
    @IBOutlet var measure2Label: UILabel!
    @IBOutlet var measure3Label: UILabel!
    @IBOutlet var measure4Label: UILabel!
    @IBOutlet var measure5Label: UILabel!
    @IBOutlet var measure6Label: UILabel!
    @IBOutlet var measure7Label: UILabel!
    @IBOutlet var measure8Label: UILabel!
    
    // MARK: - UIMethods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkDataService.fetchDrink(byId: idDrink) { (coctail) in
            let drink = coctail?.drinks?.first
            self.drink = drink
            self.updateUI()
        }
        
        backgroundImage.blurImage()
        navigationController?.navigationBar.tintColor = .white
    }
    
    // MARK: - Custom Methods
    
    private func updateUI() {
        
        guard let urlString = drink?.strDrinkThumb else { return }
        
        NetworkManager.shared.fetchImage(urlString: urlString) { (image) in
            self.imageView.image = image
        }
//        imageView.cacheImage(urlString: urlString)
        
        DispatchQueue.main.async {
            self.categoryLabel.text = "Category: \(self.drink?.strCategory ?? "")"
            self.alcoholicLabel.text = "Alcoholic: \(self.drink?.strAlcoholic ?? "")"
            self.glassLabel.text = "Glass: \(self.drink?.strGlass ?? "")"
            self.instructionLabel.text = "Instruction: \(self.drink?.strInstructions ?? "")"
            self.createIngredients()
            self.createMeasure()
        }
    }
    
    private func createIngredients() {
        
        self.ingredients1Label.text = self.drink?.strIngredient1
        self.ingredients2Label.text = self.drink?.strIngredient2
        self.ingredients3Label.text = self.drink?.strIngredient3
        self.ingredients4Label.text = self.drink?.strIngredient4
        self.ingredients5Label.text = self.drink?.strIngredient5
        self.ingredients6Label.text = self.drink?.strIngredient6
        self.ingredients7Label.text = self.drink?.strIngredient7
        self.ingredients8Label.text = self.drink?.strIngredient8
    }
    
    private func createMeasure() {
        
        measure1Label.text = drink?.strMeasure1
        measure2Label.text = drink?.strMeasure2
        measure3Label.text = drink?.strMeasure3
        measure4Label.text = drink?.strMeasure4
        measure5Label.text = drink?.strMeasure5
        measure6Label.text = drink?.strMeasure6
        measure7Label.text = drink?.strMeasure7
        measure8Label.text = drink?.strMeasure8
    }
}
