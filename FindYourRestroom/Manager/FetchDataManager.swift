//
//  FetchDataManager.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 21/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class FetchDataManager {
    
    class func get(url: String, params: Parameters? = nil) -> DataRequest {
        return makeRequest(url, method: .get, parameters: nil, encoding: URLEncoding.default)
    }
    
    class func put(url: String, params: Parameters? = nil) -> DataRequest {
        return makeRequest(url, method: .put, parameters: nil, encoding: JSONEncoding.default)
    }
    
    class func post(url: String, params: Parameters? = nil) -> DataRequest {
        return makeRequest(url, method: .post, parameters: nil, encoding: JSONEncoding.default)
    }
    
    class func delete(url: String, params: Parameters? = nil) -> DataRequest {
        return makeRequest(url, method: .delete, parameters: nil, encoding: JSONEncoding.default)
    }
    
    class func makeRequest(_ url: String, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding ) -> DataRequest {
        return Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: nil).validate()
    }
}
