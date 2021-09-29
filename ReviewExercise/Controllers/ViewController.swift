//
//  ViewController.swift
//  ReviewExercise
//
//  Created by Vo Minh Don on 9/23/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var fruitCollectionView: UICollectionView!
    @IBOutlet var itemSearchBar: UISearchBar!
    @IBOutlet weak var searchBarButtonItem: UIBarButtonItem!
    let defaults = UserDefaults.standard
    var itemArr = arr
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        fruitCollectionView.delegate = self
        fruitCollectionView.dataSource = self
        fruitCollectionView.register(UINib(nibName: Constant.cellNibName, bundle: nil), forCellWithReuseIdentifier: Constant.cellIdentifier)
        itemSearchBar.delegate = self
        resizableCell()
    }
    @IBAction func searchButtonPressed(_ sender: UIBarButtonItem) {
        searchBarButtonItem.customView = itemSearchBar
    }
    
    func resizableCell() {
        let itemSize = UIScreen.main.bounds.width/2 - 23
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        layout.itemSize = CGSize(width: itemSize, height: 236.0)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        fruitCollectionView.collectionViewLayout = layout
    }
    
}

//MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArr.count    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.cellIdentifier, for: indexPath) as! ItemCollectionViewCell
        cell.nameLabel.text = itemArr[indexPath.row].name
        cell.itemImageView.image = UIImage(imageLiteralResourceName: itemArr[indexPath.row].image)
        cell.priceLabel.attributedText = itemArr[indexPath.row].priceString
        cell.discountPriceLabel.text = itemArr[indexPath.row].discountPriceString
        cell.isLoved = defaults.bool(forKey: itemArr[indexPath.row].name)
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constant.detailSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = fruitCollectionView.indexPathsForSelectedItems {
            let destinationVC = segue.destination as! ItemDetailViewController
            destinationVC.item = itemArr[indexPath[0].row]
            fruitCollectionView.deselectItem(at: indexPath[0], animated: false)
        }
    }
}

//MARK: - UISearchBarDelegate

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text?.count == 0 {
            return
        }
        let processedString = searchBar.text!.lowercased().trim()
        itemArr = arr.filter { item in
            item.name.lowercased().contains(processedString)
        }
        fruitCollectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text? = ""
        searchBar.resignFirstResponder()
        itemArr = arr
        fruitCollectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            itemArr = arr
            fruitCollectionView.reloadData()
        }
    }
}
