//
//  HomeViewController.swift
//  NewApplication
//
//  Created by Albert on 2018/10/15.
//  Copyright © 2018 Albert.C. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    var test = ["1", "2", "3"]
    
    var unsplashs: [Unsplash] = []
    
    @IBOutlet var myTableView: UITableView!
    
    @IBOutlet var titleViewLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        unsplashs = CallUnsplash.callAPI()
        print(unsplashs)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        myTableView.contentInsetAdjustmentBehavior = .never
        
        
    }
    
    
    //MARK: TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return test.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVCVCell", for: indexPath) as! ImageGroupTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HTVCell", for: indexPath) as! HomeTableViewCell
            cell.textLabel?.text = test[indexPath.row]
            return cell
        }
    }
    
    
    //MARK: CollectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell", for: indexPath)
        return cell
    }
    
    
    
    

}
