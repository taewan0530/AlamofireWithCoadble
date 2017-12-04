//
//  Alamofire+Extension.swift
//  pangyogreat
//
//  Created by wani.kim on 2017. 11. 18..
//  Copyright © 2017년 wani.kim. All rights reserved.
//

import Foundation
import Alamofire


extension DataRequest {
  
    @discardableResult
    public func responseCodable<T: Codable>(_ type: T.Type = T.self, queue: DispatchQueue? = nil, jsonDecoder: JSONDecoder = JSONDecoder(), completionHandler: @escaping (Result<T>) -> Void) -> DataRequest {
        return self.responseData { 
            let result: Result<T>

            switch $0.result {
            case .failure(let error):
                result = .failure(error)
            case .success(let data):
                do {
                    let decodedData = try jsonDecoder.decode(T.self, from: data)
                    result = .success(decodedData)
                } catch(let error) {
                    // 디코딩 실패!
                    assertionFailure(error.localizedDescription)
                    result = .failure(error)
                }
            }
            completionHandler(result)
        }
    }
}
