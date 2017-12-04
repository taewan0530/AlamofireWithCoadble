//
//  ViewController.swift
//  AlamofireWithCodable
//
//  Created by wani.kim on 2017. 12. 4..
//  Copyright © 2017년 wani.kim. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // A Type
        // import Alamofire 필요함
        Router.restaurant.responseCodable { (response: DataResponse<Model.Restaurant>) in
            
        }
        
        // B Type
        // import Alamofire 필요 없음
        Router.restaurant.responseCodable(Model.Restaurant.self) { response in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

