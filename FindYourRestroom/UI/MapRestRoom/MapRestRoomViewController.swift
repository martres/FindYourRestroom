//
//  MapRestRoomViewController.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 21/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import UIKit
import MapKit

class MapRestRoomViewController: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
    
    var mapModel = MapRestRoomViewModel()
    
    class func makeFromStoryBoard() -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapRestRoomViewController")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initMapView()
    }
    
}

extension MapRestRoomViewController: MKMapViewDelegate {
    
    func initMapView() {
        map.delegate = self
        map.addAnnotations(mapModel.restRoomsAnnotation)
        map.showsUserLocation = true
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
    }
    
}
