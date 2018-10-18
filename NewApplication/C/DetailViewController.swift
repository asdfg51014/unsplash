//
//  DetailViewController.swift
//  NewApplication
//
//  Created by Albert on 2018/10/15.
//  Copyright © 2018 Albert.C. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet var detailCollectionView: UICollectionView!
    
    
    var unsplashs = [Unsplash]()
    
    var inde: Int?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        detailCollectionView.backgroundColor = .black
        print(inde)
        detailCollectionView.isPagingEnabled = true
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        detailCollectionView.contentInsetAdjustmentBehavior = .never
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return unsplashs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DetailCollectionViewCell
        if let url = URL(string: unsplashs[indexPath.row].urls.regular) {
            if let show = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    cell.detailImageView.image = UIImage(data: show)
                }
            }
        }
        cell.userName.setTitle(unsplashs[indexPath.row].user.name, for: .normal)
        print("cell height:\(cell.bounds.width)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = UIScreen.main.bounds.width
        let cellHeight = UIScreen.main.bounds.height
//        print("cellHeight: \(cellHeight)")
//        print("cellwidth: \(cellWidth)")
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    
    
}
