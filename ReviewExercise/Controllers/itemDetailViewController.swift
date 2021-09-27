//
//  itemDetailViewController.swift
//  ReviewExercise
//
//  Created by Vo Minh Don on 9/25/21.
//

import UIKit

class itemDetailViewController: UIViewController {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemRateLabel: UILabel!
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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        roundComponent()
        shadowComponent()
    }
    
    func roundComponent() {
        itemBackgroundView.layer.cornerRadius = itemBackgroundView.bounds.size.height * 0.2
        itemBackgroundView.layer.borderWidth = 2
        itemBackgroundView.layer.borderColor = UIColor.white.cgColor
        plusButton.layer.cornerRadius = plusButton.bounds.size.height * 0.2
        plusButton.layer.borderWidth = 2
        plusButton.layer.borderColor = UIColor.white.cgColor
        minusButton.layer.cornerRadius = minusButton.bounds.size.height * 0.2
        minusButton.layer.borderWidth = 2
        minusButton.layer.borderColor = UIColor.white.cgColor
        quanlityView.layer.cornerRadius = quanlityView.bounds.size.height * 0.5
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
        itemBackgroundView.layer.shadowColor = UIColor.gray.cgColor
        itemBackgroundView.layer.shadowOffset = CGSize(width: 7.0, height: 7.0)
        itemBackgroundView.layer.shadowOpacity = 0.3
        itemBackgroundView.layer.shadowRadius = 10.0
        itemBackgroundView.layer.masksToBounds = false
        
        quanlityView.layer.shadowColor = UIColor.gray.cgColor
        quanlityView.layer.shadowOffset = CGSize(width: 7.0, height: 7.0)
        quanlityView.layer.shadowOpacity = 0.3
        quanlityView.layer.shadowRadius = 8.0
        quanlityView.layer.masksToBounds = false
        
        payButton.layer.shadowColor = UIColor.gray.cgColor
        payButton.layer.shadowOffset = CGSize(width: 7.0, height: 7.0)
        payButton.layer.shadowOpacity = 0.9
        payButton.layer.shadowRadius = 20.0
        payButton.layer.masksToBounds = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
