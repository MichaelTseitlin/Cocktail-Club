//
//  Extensions+UIImageView.swift
//  Cocktail Club
//
//  Created by Michael Tseitlin on 7/5/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func blurImage() {
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
}
