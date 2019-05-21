//
//  MapViewController.swift
//  FoodPin
//
//  Created by Igor Tkach on 5/25/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit
import MapKit



class MapViewController: UIViewController, MKMapViewDelegate {
    
    
    
    @IBOutlet var mapView: MKMapView!
    
    var restaurant: Restaurant!

    override func viewDidLoad() {
        super.viewDidLoad()

        //Convert address to cordinate and annotate it on map
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location, completionHandler: {
        placemarks, error in
            if error != nil {
              print("\(String(describing: error))")
                return
            }
        
            if let placemarks = placemarks {
                let placemark = placemarks[0]
                
                //Add annotation 
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                
                if let location  = placemark.location {
                    annotation.coordinate = location.coordinate
                
                
                self.mapView.showAnnotations([annotation], animated: true) //put pin on the map
                self.mapView.selectAnnotation(annotation, animated: true) //callout bubble
            }
            }
        
        })
        
        //Show Compass
        mapView.showsCompass = true
        
        //ShowScale 
        mapView.showsScale = true
        
        //ShowTrafic 
        mapView.showsTraffic = true
        
        
        mapView.delegate = self
    }
    
    //Show the photo on map location with MkMapViewDelegate
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        //Reuse the annotation if possible
        var annotationView: MKPinAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as?
        MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        
        let leftIconView = UIImageView(frame: CGRect.init(x:0,y:0,width: 53,height: 53))
        leftIconView.image = UIImage(named: restaurant.image)
        annotationView?.leftCalloutAccessoryView = leftIconView
        
        annotationView?.pinTintColor = UIColor.black
        
        return annotationView
        
    }

  
    


}
