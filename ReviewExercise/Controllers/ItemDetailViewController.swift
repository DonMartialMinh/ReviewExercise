//
//  itemDetailViewController.swift
//  ReviewExercise
//
//  Created by Vo Minh Don on 9/25/21.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemRateLabel: UILabel!
    @IBOutlet weak var itemTypeLabel: UILabel!
    @IBOutlet weak var itemTypeView: UIView!
    @IBOutlet weak var itemBackgroundView: UIView!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var quanlityLabel: UILabel!
    @IBOutlet weak var quanlityView: UIView!
    @IBOutlet weak var sojaButton: UIButton!
    @IBOutlet weak var senfButton: UIButton!
    @IBOutlet weak var advocadoButton: UIButton!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var authorButton: UIBarButtonItem!
    
    var item: Item?
    var quanlity = 1
    
    var computedPriceStringFormat: String {
        return String(format: "$%.1f", item!.discountPrice * Double(quanlity))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        roundComponent()
        shadowComponent()
        loadData()
    }
    
    func roundComponent() {
//        itemBackgroundView.layer.cornerRadius = itemBackgroundView.bounds.size.height * 0.2
//        itemBackgroundView.layer.borderWidth = 2
//        itemBackgroundView.layer.borderColor = UIColor.white.cgColor
        
        itemTypeView.layer.cornerRadius = itemTypeView.bounds.size.height * 0.5
        itemTypeView.layer.borderWidth = 1
        itemTypeView.layer.borderColor = UIColor.white.cgColor
        
        plusButton.layer.cornerRadius = plusButton.bounds.size.height * 0.2
        plusButton.layer.borderWidth = 2
        plusButton.layer.borderColor = UIColor.white.cgColor
        
        minusButton.layer.cornerRadius = minusButton.bounds.size.height * 0.2
        minusButton.layer.borderWidth = 2
        minusButton.layer.borderColor = UIColor.white.cgColor
        
        //quanlityView.layer.cornerRadius = quanlityView.bounds.size.height * 0.5
        
        sojaButton.layer.cornerRadius = sojaButton.bounds.size.height * 0.5
        sojaButton.layer.borderWidth = 2
        sojaButton.layer.borderColor = UIColor.white.cgColor
        
        senfButton.layer.cornerRadius = senfButton.bounds.size.height * 0.5
        senfButton.layer.borderWidth = 2
        senfButton.layer.borderColor = UIColor.white.cgColor
        
        advocadoButton.layer.cornerRadius = advocadoButton.bounds.size.height * 0.5
        advocadoButton.layer.borderWidth = 2
        advocadoButton.layer.borderColor = UIColor.white.cgColor
        
        payButton.layer.cornerRadius = payButton.bounds.size.height * 0.5
        payButton.layer.borderWidth = 2
        payButton.layer.borderColor = UIColor.white.cgColor
    }
    
    func shadowComponent() {
//        itemBackgroundView.layer.shadowColor = UIColor.gray.cgColor
//        itemBackgroundView.layer.shadowOffset = CGSize(width: 7.0, height: 7.0)
//        itemBackgroundView.layer.shadowOpacity = 0.3
//        itemBackgroundView.layer.shadowRadius = 10.0
//        itemBackgroundView.layer.masksToBounds = false
        
        itemTypeView.layer.shadowColor = UIColor.gray.cgColor
        itemTypeView.layer.shadowOffset = CGSize(width: 7.0, height: 7.0)
        itemTypeView.layer.shadowOpacity = 0.2
        itemTypeView.layer.shadowRadius = 5.0
        itemTypeView.layer.masksToBounds = false
        
//        quanlityView.layer.shadowColor = UIColor.gray.cgColor
//        quanlityView.layer.shadowOffset = CGSize(width: 7.0, height: 7.0)
//        quanlityView.layer.shadowOpacity = 0.3
//        quanlityView.layer.shadowRadius = 8.0
//        quanlityView.layer.masksToBounds = false
        
        sojaButton.layer.shadowColor = UIColor.gray.cgColor
        sojaButton.layer.shadowOffset = CGSize(width: 7.0, height: 7.0)
        sojaButton.layer.shadowOpacity = 0.2
        sojaButton.layer.shadowRadius = 10.0
        sojaButton.layer.masksToBounds = false
        
        senfButton.layer.shadowColor = UIColor.gray.cgColor
        senfButton.layer.shadowOffset = CGSize(width: 7.0, height: 7.0)
        senfButton.layer.shadowOpacity = 0.2
        senfButton.layer.shadowRadius = 10.0
        senfButton.layer.masksToBounds = false
        
        advocadoButton.layer.shadowColor = UIColor.gray.cgColor
        advocadoButton.layer.shadowOffset = CGSize(width: 7.0, height: 7.0)
        advocadoButton.layer.shadowOpacity = 0.2
        advocadoButton.layer.shadowRadius = 10.0
        advocadoButton.layer.masksToBounds = false
        
        payButton.layer.shadowColor = UIColor.gray.cgColor
        payButton.layer.shadowOffset = CGSize(width: 7.0, height: 7.0)
        payButton.layer.shadowOpacity = 0.9
        payButton.layer.shadowRadius = 20.0
        payButton.layer.masksToBounds = false
    }
    
    func loadData() {
        itemImageView.image = UIImage(imageLiteralResourceName: item!.image)
        itemNameLabel.text = item!.name
        itemRateLabel.text = item!.ratingString
        itemTypeLabel.text = item!.type
        payButton.setTitle(item!.discountPriceString, for: .normal)
    }
    
    @IBAction func quanlityChangePressed(_ sender: UIButton) {
        if sender === minusButton {
            if quanlity > 1 {
                quanlity = quanlity - 1
            }
        }
        else {
            quanlity = quanlity + 1
        }
        quanlityLabel.text = "\(quanlity)"
        payButton.setTitle(computedPriceStringFormat, for: .normal)
    }
    
    @IBAction func allergeneChangePressed(_ sender: UIButton) {
        sojaButton.backgroundColor = UIColor.white
        sojaButton.setTitleColor(UIColor.gray, for: .normal)
        senfButton.backgroundColor = UIColor.white
        senfButton.setTitleColor(UIColor.gray, for: .normal)
        advocadoButton.backgroundColor = UIColor.white
        advocadoButton.setTitleColor(UIColor.gray, for: .normal)
        
        sender.backgroundColor = UIColor(named: Constant.Color.orange)
        sender.setTitleColor(UIColor.black, for: .normal)
    }
    
}
