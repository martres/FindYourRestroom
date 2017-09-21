//
//  RestRoomService.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 21/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

typealias RestRoomsResult = (_ restRooms: [RestRoom], _ error: Error?) -> ()

class RestRoomService {
    
    class func getRestRooms(completion: @escaping RestRoomsResult) {
        FetchDataManager.get(url: URLManager.urlForRestrooms()).responseArray(queue: nil, keyPath: "records", context: nil) { (result: DataResponse<[RestRoom]>) in
            completion(result.result.value ?? [], result.result.error)
        }
    }
}
