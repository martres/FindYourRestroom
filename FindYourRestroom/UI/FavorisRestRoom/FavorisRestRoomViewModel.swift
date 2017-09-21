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
        getData()
    }
    
    func getData() {
        restRooms = RestRoomService.getRestRoomSave(withFilter: "favorite = 1")
    }
    
}
