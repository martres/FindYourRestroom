//
//  CLLocationExtension.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 22/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import MapKit

extension CLLocation {
    
    func distanceInString(_ latitude: Double,_  longitude: Double) -> String {
        let fromLocation = CLLocation(latitude: latitude, longitude: longitude)
        let distanceInMeters = distance(from: fromLocation)
        if distanceInMeters >= 1000 {
            return "\(Int(distanceInMeters / 1000)) km(s)"
        } else {
            return "\(Int(distanceInMeters)) meter(s)"
        }
    }
    
}
