//
//  Router.swift
//  pangyogreat
//
//  Created by wani.kim on 2017. 11. 14..
//  Copyright © 2017년 wani.kim. All rights reserved.
//

import Foundation
import Alamofire

enum Router {
    static let baseURLString = "https://test.com"
    
    case restaurant
    case menu(date: Date)
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .restaurant:
            return "/restaurant"
        case .menu:
            return "/menu"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .restaurant:
            return nil
        case .menu(let date):
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyyMMdd"
            return ["created": formatter.string(from: date)]
        }
    }
}

//https://github.com/Otbivnoe/CodableAlamofire
//https://medium.com/@ashishkakkad8/use-of-codable-with-jsonencoder-and-jsondecoder-in-swift-4-71c3637a6c65


extension Router: URLRequestConvertible {
    func request() -> DataRequest {
        return Alamofire.request(self)
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest = try URLEncoding.default.encode(urlRequest, with: parameter)

        return urlRequest
    }
}



