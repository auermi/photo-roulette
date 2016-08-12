//
//  ViewController.swift
//  Unsplash
//
//  Created by Michael Andrew Auer on 8/7/16.
//  Copyright © 2016 Usonia LLC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://api.unsplash.com/photos/?client_id=" + Secret().unsplashClientID
        Alamofire.request(.GET, url).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    print ((json.first?.1["urls"]["thumb"].string)!)
                }
            case .Failure(let error):
                print(error)
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

