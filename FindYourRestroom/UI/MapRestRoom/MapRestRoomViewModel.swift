//
//  MapRestRoomViewModel.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 21/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import Foundation

class MapRestRoomViewModel {
    
    var restRooms = [RestRoom]()
    var restRoomsAnnotation = [RestRoomAnnotation]()
    
    init() {
        getData()
    }
    
    func getData() {
        restRooms = RestRoomService.getRestRoomSave()
        
        for item in restRooms {
            restRoomsAnnotation.append(RestRoomAnnotation(restRoom: item))
        }
    }
    
    func refreshData(completion: @escaping () -> ()) {
        restRooms.removeAll()
        restRoomsAnnotation.removeAll()
        RestRoomService.getRestRooms {[weak self] (restRooms, error) in
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.getData()
            completion()
        }
    }
}
