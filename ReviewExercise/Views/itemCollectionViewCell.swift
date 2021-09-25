//
//  itemCollectionViewCell.swift
//  ReviewExercise
//
//  Created by Vo Minh Don on 9/23/21.
//

import UIKit

class itemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var discountPriceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var cartButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        roundComponent()
        // Initialization code
    }

    func roundComponent() {
        self.layer.cornerRadius = self.bounds.size.width * 0.1
        favoriteButton.layer.cornerRadius = self.favoriteButton.bounds.size.width * 0.3
        cartButton.layer.cornerRadius = self.cartButton.bounds.size.width * 0.3
    }
    
}
