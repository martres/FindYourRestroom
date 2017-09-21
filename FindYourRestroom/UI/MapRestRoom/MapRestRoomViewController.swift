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
        UserLocationManager.sharedManager.delegate = self
    }
    
}

extension MapRestRoomViewController: LocationUpdateProtocol {
    
    func locationDidUpdateToLocation(location: CLLocation) {
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.map.setRegion(region, animated: true)
    }
}

extension MapRestRoomViewController: MKMapViewDelegate {
    
    func initMapView() {
        map.delegate = self
        map.showsUserLocation = true
        for item in mapModel.restRoomsAnnotation {
            map.addAnnotation(item)
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("TEST")
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annot = annotation as? RestRoomAnnotation else {
            return nil
        }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "restRoomViewAnnotation") as? MKPinAnnotationView
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annot, reuseIdentifier: "restRoomViewAnnotation")
            annotationView?.isEnabled = true
            annotationView?.canShowCallout = true
            annotationView?.pinTintColor = UIColor.red
            
            let infoButton = UIButton(type: .infoLight)
            annotationView?.rightCalloutAccessoryView = infoButton
        } else {
            annotationView?.annotation = annot
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let annotation = view.annotation as? RestRoomAnnotation {
            
        }
    }
    
    
    
}
