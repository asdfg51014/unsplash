//
//  HomeViewController.swift
//  NewApplication
//
//  Created by Albert on 2018/10/15.
//  Copyright © 2018 Albert.C. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var myTableView: UITableView!
    
    func getApi(){
        let apiUrl = URL(string: "https://api.unsplash.com/photos/?client_id=675888f23841a95b64484b9455798829c92fe6672c2c642fb575874f7831e7f5")
        URLSession.shared.dataTask(with: apiUrl!) { (data, response, error) in
            do {
                var getApi = try JSONDecoder().decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: <#T##Data#>)
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        myTableView.contentInsetAdjustmentBehavior = .never
        
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
