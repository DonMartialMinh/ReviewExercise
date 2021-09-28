//
//  itemCollectionViewCell.swift
//  ReviewExercise
//
//  Created by Vo Minh Don on 9/23/21.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var discountPriceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var cartButton: UIButton!
    
    var isLoved: Bool? {
        didSet {
            checkFavorite()
        }
    }
    
    let defaults = UserDefaults.standard
    override func awakeFromNib() {
        super.awakeFromNib()
        roundComponent()
        // Initialization code
    }
    
    func checkFavorite() {
        isLoved == true ? (favoriteButton.backgroundColor = UIColor.systemPink) : (favoriteButton.backgroundColor = UIColor.gray)
    }

    func roundComponent() {
        self.layer.cornerRadius = self.bounds.size.width * 0.1
        favoriteButton.layer.cornerRadius = self.favoriteButton.bounds.size.width * 0.3
        cartButton.layer.cornerRadius = self.cartButton.bounds.size.width * 0.3
    }
    
    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
        isLoved = !(isLoved!)
        checkFavorite()
        print (nameLabel.text!)
        defaults.set(isLoved, forKey: nameLabel.text!)
    }
    
}
