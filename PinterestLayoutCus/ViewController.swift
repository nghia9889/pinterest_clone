//
//  ViewController.swift
//  PinterestLayoutCus
//
//  Created by Tao Trong Nghia on 8/31/20.
//  Copyright © 2020 Tao Trong Nghia. All rights reserved.
//

import UIKit

struct Item {
    var imageName : String
}

class ViewController: UIViewController {
     
    @IBOutlet weak var collectionView: UICollectionView!

    
    let cellIdentifier = "CollectionViewCell"
    var items : [Item] = [Item(imageName: "1"),
                          Item(imageName: "2"),
                          Item(imageName: "3"),
                          Item(imageName: "4"),
                          Item(imageName: "5"),
                          Item(imageName: "6"),
                          Item(imageName: "7"),
                          Item(imageName: "8"),
                          Item(imageName: "9"),
                          Item(imageName: "10"),]
    var name =  ["Monkey D Luffy", "Nami", "Nico Robin", "Roronoa Zoro", "Upsopp", "Tony Tony Chopper", "Brook", "Franky", "Jinbei", "Vinsmoke Sanji" ]
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    let viewImageSegueIdentifier = "viewImageSegueIdentifier"

    let lineSpacing: CGFloat = 5
    let interItemSpacing: CGFloat = 5

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupCollectionViewItemSize()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    private func setupCollectionView() {
      collectionView.delegate = self
      collectionView.dataSource = self
      let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
      collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    private func setupCollectionViewItemSize() {
        let customLayout = CustomLayout()
        customLayout.delegate = self
        collectionView.collectionViewLayout = customLayout
    }
    
    

}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CollectionViewCell
        cell.imgView.image = UIImage(named: items[indexPath.item].imageName)
        cell.lblName.text = "\(name[indexPath.row])"
        return cell
    }
    
    
}
extension ViewController: CustomLayoutDelegate{
    func collectionView(_ collectionView: UICollectionView, sizeOfPhotoIndexPath indexPath: IndexPath) -> CGSize {
        return UIImage(named: items[indexPath.item].imageName)!.size
    }
    
    
}
