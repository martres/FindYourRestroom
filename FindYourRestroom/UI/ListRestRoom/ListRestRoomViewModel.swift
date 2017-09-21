//
//  ListRestRoomViewModel.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 21/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import Foundation

class ListRestRoomViewModel {
    
    var restRooms = [RestRoom]()
    
    init(restRooms: [RestRoom]) {
        self.restRooms = restRooms
    }
    
    init() {
        self.restRooms = RestRoomService.getRestRoomSave()
    }
    
    func numberOfRow(inSection: Int) -> Int {
        return restRooms.count
    }
    
    func numberOfSection() -> Int {
        return 1
    }
    
    func orderByDistance() {
        
    }
    
    func getAdresse(atIndex: Int) -> String {
        let restRoom = restRooms[atIndex]
        return (restRoom.numero_voie) + " " + (restRoom.nom_voie)
    }
    
    func getArrondissement(atIndex: Int) -> String {
        let restRoom = restRooms[atIndex]
        return restRoom.getArrondissement()
    }
    
    func getCoordinates(atIndex: Int) -> String {
        let restRoom = restRooms[atIndex]
        return "( \(restRoom.latitude) / \(restRoom.longitude) )"
    }
    
    func getOpeningDate(atIndex: Int) -> String {
        let restRoom = restRooms[atIndex]
        return restRoom.openDate
    }
    
    func getDistance(atIndex: Int) -> String {
        let restRoom = restRooms[atIndex]
        return UserLocationManager.sharedManager.currentLocation?.distanceInString(restRoom.latitude, restRoom.longitude) ?? ""
    }
}
