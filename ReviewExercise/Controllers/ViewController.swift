//
//  ViewController.swift
//  ReviewExercise
//
//  Created by Vo Minh Don on 9/23/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var fruitCollectionView: UICollectionView!
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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
        cell.isLoved = defaults.bool(forKey: arr[indexPath.row].name)
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = fruitCollectionView.indexPathsForSelectedItems {
            let destinationVC = segue.destination as! itemDetailViewController
            destinationVC.item = arr[indexPath[0].row]
            fruitCollectionView.deselectItem(at: indexPath[0], animated: false)
        }
    }
}


