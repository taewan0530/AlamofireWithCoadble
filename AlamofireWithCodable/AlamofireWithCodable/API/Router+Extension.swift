//
//  Alamofire+Extension.swift
//  pangyogreat
//
//  Created by wani.kim on 2017. 11. 18..
//  Copyright © 2017년 wani.kim. All rights reserved.
//

import Foundation
import Alamofire


extension Router {
    
    @discardableResult
    public func responseData(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Data>) -> Void) -> DataRequest {
        return Alamofire.request(self).responseData(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    public func responseCodable<T: Codable>(_ type: T.Type = T.self, queue: DispatchQueue? = nil, jsonDecoder: JSONDecoder = JSONDecoder(), completionHandler: @escaping (DataResponse<T>) -> Void) -> DataRequest {
        return Alamofire.request(self).responseData { 
            let resultResponse: DataResponse<T>
            switch $0.result {
            case .failure(let error):
                resultResponse = DataResponse<T>(request: $0.request, 
                                                 response: $0.response, 
                                                 data: $0.data, 
                                                 result: .failure(error))
            case .success(let data):
                do {
                    let result = try jsonDecoder.decode(T.self, from: data)
                    resultResponse = DataResponse<T>(request: $0.request, 
                                                     response: $0.response, 
                                                     data: $0.data, 
                                                     result: .success(result))
                } catch(let error) {
                    assertionFailure(error.localizedDescription)
                    resultResponse = DataResponse<T>(request: $0.request, 
                                                     response: $0.response, 
                                                     data: $0.data, 
                                                     result: .failure(error))
                }
            }
            completionHandler(resultResponse)
        } // responseData
    }
}
