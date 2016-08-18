//
//  ViewController.swift
//  PhotoRoulette
//
//  Created by Michael Andrew Auer on 8/7/16.
//  Copyright © 2016 Usonia LLC. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var UnsplashImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://api.unsplash.com/photos/random/?client_id=" + Secret().unsplashClientID
        
        
        Alamofire.request(.GET, "https://httpbin.org/image/png")
            .responseImage { response in
                debugPrint(response)
                
                print(response.request)
                print(response.response)
                debugPrint(response.result)
                
                if let image = response.result.value {
                    print("image downloaded: \(image)")
                    self.UnsplashImageView.image = image
                }
        }
        //UnsplashImageView.image = GetImage()
    }
}



