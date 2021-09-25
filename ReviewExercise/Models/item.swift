//
//  item.swift
//  ReviewExercise
//
//  Created by Vo Minh Don on 9/25/21.
//

import Foundation

public struct Item {
    var name: String
    var price: Double
    var discount: Double
    var image: String
    var rating: Double
    var type: String
    
    var priceString: String {
        return "$\(price)"
    }
    
    var discountPriceString: String {
        return String(format: "$%.1f", price - price * discount)
    }
}