//
//  RestRoom.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 21/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class RestRoom: Object, Mappable {
    
    dynamic var id = 0
    dynamic var arrondissement = ""
    dynamic var nom_voie = ""
    dynamic var numero_voie = ""
    dynamic var openDate = ""
    dynamic var longitude = 0.0
    dynamic var latitude = 0.0
    dynamic var favorite = false
    
    override static func primaryKey() -> String {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
        
    func mapping(map: Map) {
        id              <- map["fields.objectid"]
        arrondissement  <- map["fields.arrondissement"]
        nom_voie        <- map["fields.nom_voie"]
        numero_voie     <- map["fields.numero_voie"]
        openDate        <- map["fields.horaires_ouverture"]
        
        var arrayCoord: [Double]?
        arrayCoord      <- map["fields.geom_x_y"]
        latitude = arrayCoord?[0] ?? 0
        longitude = arrayCoord?[1] ?? 0
    }
    
    override static func ignoredProperties() -> [String] {
        return ["favorite"]
    }
    
    func updateFavorite(valueFavorite: Bool) {
        try! RealmManager.update(type: RestRoom.self, changes: ["id": self.id as AnyObject, "favorite": valueFavorite as AnyObject])
    }
    
    func getArrondissement() -> String {
        if let nbrArrondissement = Int(self.arrondissement) {
            switch nbrArrondissement {
            case 1:
                return self.arrondissement + "st"
            case 2:
                return self.arrondissement + "nd"
            case 3:
                return self.arrondissement + "rd"
            default:
                return self.arrondissement + "th"
            }
        }
        return self.arrondissement
    }
}
