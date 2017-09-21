//
//  LocationManager.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 21/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import MapKit

protocol LocationUpdateProtocol {
    func locationDidUpdateToLocation(location : CLLocation)
}

class UserLocationManager: NSObject, CLLocationManagerDelegate {
    
    static let sharedManager = UserLocationManager()
    
    private var locationManager = CLLocationManager()
    
    var currentLocation : CLLocation?
    
    var delegate : LocationUpdateProtocol!
    
    private override init () {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLLocationAccuracyHundredMeters
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations[0]
        manager.stopUpdatingLocation()
        DispatchQueue.main.async {
            self.delegate.locationDidUpdateToLocation(location: self.currentLocation!)
        }
    }
    
}
