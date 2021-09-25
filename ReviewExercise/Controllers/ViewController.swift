//
//  ViewController.swift
//  ReviewExercise
//
//  Created by Vo Minh Don on 9/23/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var fruitCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitCollectionView.delegate = self
        fruitCollectionView.dataSource = self
        fruitCollectionView.register(UINib(nibName: "itemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "itemCell")
        // Do any additional setup after loading the view.
        
    }
}

//MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! itemCollectionViewCell
        cell.nameLabel.text = arr[indexPath.row].name
        cell.itemImageView.image = UIImage(imageLiteralResourceName: arr[indexPath.row].image)
        cell.priceLabel.attributedText = arr[indexPath.row].priceString
        cell.discountPriceLabel.text = arr[indexPath.row].discountPriceString
        return cell
    }
    
}

//MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    
}

