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
    var filter = ""
    
    init(restRooms: [RestRoom]) {
        self.restRooms = restRooms
    }
    
    init() {
        getData()
    }
    
    func getData() {
        self.restRooms = RestRoomService.getRestRoomSave(withFilter: filter)
        for item in restRooms {
            let longitude = item.longitude
            let latitude = item.latitude
            item.updateDistance(distance: UserLocationManager.sharedManager.getDistance(longitude: longitude, latitude: latitude))
        }
        self.restRooms.sort{$0.0.distance < $0.1.distance}
    }
    
    func refreshData(completion: @escaping () -> ()) {
        
        RestRoomService.getRestRooms {[weak self] (_, _) in
            guard let strongSelf = self else {
                return
            }
            strongSelf.getData()
            completion()
        }
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
        return ((restRoom.numero_voie) + " " + (restRoom.nom_voie)).lowercased()
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
