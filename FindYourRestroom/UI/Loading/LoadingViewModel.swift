//
//  LoadingViewModel.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 21/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import Foundation

class LoadingViewModel  {
        
    func fetchRestRoom(completion: @escaping (_ success: Bool) -> ()) {
        RestRoomService.getRestRooms { (restRooms, error) in
            if let _ = error {
                if RestRoomService.getRestRoomSave().isEmpty {
                    return completion(false)
                }
            }
            return completion(true)
        }
    }
    
}
