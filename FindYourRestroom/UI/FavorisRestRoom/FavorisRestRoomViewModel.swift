//
//  FavorisRestRoomViewModel.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 21/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import Foundation

class FavorisRestRoomViewModel {
    
    var restRooms = [RestRoom]()
    
    init() {
        restRooms = RestRoomService.getRestRoomSave(withFilter: "favorites = 1")
    }
    
}
