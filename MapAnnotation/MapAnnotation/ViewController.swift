//
//  ViewController.swift
//  MapAnnotation
//
//  Created by Manpreet Singh on 31/08/17.
//  Copyright © 2017 Manpreet Singh. All rights reserved.
//


import UIKit
import MapKit
import CoreLocation
class ViewController: UIViewController ,CLLocationManagerDelegate{
    var locationManager:CLLocationManager!
     let places = Place.getPlaces()
    var isAnnotationAdded = false

    @IBOutlet var mainMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        determineMyCurrentLocation()
    }
    

    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
 
        
    manager.stopUpdatingLocation()

    
  //  mainMapView.showsUserLocation = true
        
        
        let viewRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 5000, 5000)
        
        mainMapView.setRegion(viewRegion, animated: true)
        
        if !isAnnotationAdded
        {
        self.addAnnotations()
        }
        
    }
    
    
    func addAnnotations() {
        
        
        
        mainMapView.delegate = self
        
        mainMapView?.addAnnotations(places)
        

        
    }
    

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    
    
    
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
            
        else {

            let reuseId = "pin"
            let  pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView.canShowCallout = true
            pinView.animatesDrop = true
            pinView.pinTintColor = UIColor.darkGray
            pinView.isDraggable = true
            pinView.accessibilityLabel = "hello"
            let btn = UIButton(type: .detailDisclosure)
            pinView.rightCalloutAccessoryView = btn
            return pinView
            
        }
    }
    
   }



