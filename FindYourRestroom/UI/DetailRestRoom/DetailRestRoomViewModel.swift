//
//  DetailRestRoomViewModel.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 21/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import Foundation

class DetailRestRoomViewModel {
    
    var restRoom: RestRoom?
    
    init(restRoom: RestRoom) {
        self.restRoom = restRoom
    }
    
    func getAdresse() -> String {
        return ((restRoom?.numero_voie ?? "") + " " + (restRoom?.nom_voie ?? "")).lowercased()
    }
    
    func getArrondissement() -> String {
        return restRoom?.getArrondissement() ?? ""
    }
    
    func getCoordinates() -> String {
        return "( \(restRoom?.latitude ?? 0) / \(restRoom?.longitude ?? 0) )"
    }
    
    func getOpeningDate() -> String {
        return restRoom?.openDate ?? ""
    }
    
    func isFavorite() -> Bool {
        return restRoom?.favorite ?? false
    }
    
    func updateFavorite() {
        if let favorite = restRoom?.favorite {
            restRoom?.updateFavorite(valueFavorite: !favorite)
        }
    }
}
