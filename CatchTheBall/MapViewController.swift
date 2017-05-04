//
//  MapViewController.swift
//  CatchTheBall
//
//  Created by Jonathan Edgar on 4/25/17.
//  Copyright © 2017 Jonathan Edgar. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var  locationManager: CLLocationManager!
    var ballCount: Int = 0
    var ballLocation = CLLocationCoordinate2D()
    var playerLocation = CLLocationCoordinate2D()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest //will take a little bit more out of the phone
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.mapView.showsUserLocation = true
        self.locationManager.startUpdatingLocation()
        self.playerLocation = (locationManager.location?.coordinate)!

        
    }
    
    func getNewBall() {
        //First: use the location search to pull local info (print to Command Line)
        
        
        //Second: Show using annotation
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView] ) {
        //Adjusts Map Zoom
        if let annotationView = views.first {
            if let annotaion = annotationView.annotation {
                if annotaion is MKUserLocation {
                    let region = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.coordinate, 500, 500)
                    self.mapView.setRegion(region, animated: true)
                    
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier) == "ToAugmentedRealitySegue" {
            
        }
    }
    
    func signInButton() {
        //Segue to userAuth page
        
        performSegue(withIdentifier: "ToAugmentedRealitySegue", sender: nil)
    }
    
    @IBAction func augmentReality(_ sender: Any) {
        //Segue to HDAugmentedRealityView
        
    }
}
