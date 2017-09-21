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
}
