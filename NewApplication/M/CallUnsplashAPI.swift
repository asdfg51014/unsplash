//
//  CallUnsplashAPI.swift
//  NewApplication
//
//  Created by Albert on 2018/10/16.
//  Copyright © 2018 Albert.C. All rights reserved.
//

import Foundation

struct CallUnsplash {
    

    static func callapi(call: @escaping ([Unsplash]) -> Void) {
        var callUnsplash = [Unsplash]()
        let urlObj = URL(string: "https://api.unsplash.com/photos/?client_id=675888f23841a95b64484b9455798829c92fe6672c2c642fb575874f7831e7f5")

        let task = URLSession.shared.dataTask(with: urlObj!) { (data, response, error) in
            guard let data = data else { return }
            do {
                let informationInfo = try JSONDecoder().decode([Unsplash].self, from: data)
                print(informationInfo)
                callUnsplash = informationInfo
                print(callUnsplash)
                call(callUnsplash)
                
            } catch { print("error") }
            }.resume()
        
        }
}


