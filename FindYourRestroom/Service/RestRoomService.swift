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
            if let restRooms = result.result.value {
                do {
                    try RealmManager.addOrUpdate(objects: restRooms)
                } catch {
                    print("REST ROOM NOT SAVE ERROR")
                }
            }
            completion(result.result.value ?? [], result.result.error)
        }
    }
    
    class func getRestRoomSave(withFilter: String? = nil) -> [RestRoom] {
        do {
            let restRoomsResult = try RealmManager.get(objectType: RestRoom.self, filter: withFilter)
            return restRoomsResult.toArray()
        } catch {
            print(error)
            return []
        }
    }
}
