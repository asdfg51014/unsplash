//
//  HomeViewController.swift
//  NewApplication
//
//  Created by Albert on 2018/10/15.
//  Copyright © 2018 Albert.C. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var test = ["1", "2", "3"]
    
    var unsplashs: [Unsplash] = []
    var images: [UIImage] = []
    
    @IBOutlet var myTableView: UITableView!
    
    @IBOutlet var titleViewLabel: UILabel!
    
    func getApi(){
        CallUnsplash.callapi(call: {(theCall) in
            self.unsplashs = theCall
            print("in viweController")
            print(self.unsplashs)
            DispatchQueue.main.async {
                
                self.myTableView.reloadData()
                
            }
        })
    }
    
//    func calculate(a: CGFloat, b: CGFloat ) -> CGFloat {
//        var c = a / b
//        var w = UIScreen.main.bounds.width
//        var h = w / c
//        return h
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        
        getApi()
        print(unsplashs)
        print(123)
        
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
            return unsplashs.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 220
        } else {
           return 300
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVCVCell", for: indexPath) as! ImageGroupTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HTVCell", for: indexPath) as! HomeTableViewCell
            if let url = URL(string: unsplashs[indexPath.row].urls.small) {
                if let show = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        cell.showImage.image = UIImage(data: show)
                    }
                }
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = myTableView.indexPathForSelectedRow {
                let segueImage = segue.destination as! DetailViewController
                segueImage.unsplashs = unsplashs
                segueImage.inde = indexPath.row
            }
        }
    }
    
}
