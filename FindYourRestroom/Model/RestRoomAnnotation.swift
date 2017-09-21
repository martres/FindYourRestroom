//
//  RestRoomAnnotation.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 21/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import MapKit

class RestRoomAnnotation: NSObject, MKAnnotation {
    
    let restRoom: RestRoom?
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(restRoom: RestRoom) {
        self.restRoom = restRoom
        self.coordinate = CLLocationCoordinate2D(latitude: restRoom.latitude, longitude: restRoom.longitude)
        self.title = restRoom.numero_voie + " " + restRoom.nom_voie
        super.init()
    }
    
}
