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

  
    }

    private func example() {
        // A Type
        // import Alamofire 필요함 Result 사용하기 위해서
        Router.restaurant
            .request()
            .responseCodable { (result: Result<Model.Restaurant>) in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let value):
                    print(value)
                }
        }
        
        // B Type
        // import Alamofire 필요 없음
        Router.restaurant
            .request()
            .responseCodable(Model.Restaurant.self) { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let value):
                    print(value)
                }
        }
        
        // 리스트는 이런 식으로 호출
        Router.restaurant
            .request()
            .responseCodable([Model.Restaurant].self) { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let value):
                    print(value)
                }
        }
    }

}

