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
    var BallItems = [MKMapItem]()

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let catchBallAlert = UIAlertController(title: "Ooops...", message: "Looks like you dropped the ball, go catch it!!!", preferredStyle: .alert)
        let goAlertAction = UIAlertAction(title: "I'm On It!", style: .cancel) { (UIAlertAction) in
            
            self.getNewBall()
        }
        
        catchBallAlert.addAction(goAlertAction)
        
        let time = DispatchTime.now() + 7
        DispatchQueue.main.asyncAfter(deadline: time) {
            
            self.present(catchBallAlert, animated: true, completion: nil)
            
        }
    }
    
    func getNewBall() {
        //First: use the location search to pull local info (print to Command Line)
        let localSearch = MKLocalSearchRequest()
        localSearch.naturalLanguageQuery = "Coffee"
        localSearch.region = mapView.region
        
        let search = MKLocalSearch(request: localSearch)
        
        search.start { (response, error) in
            
            if error != nil {
                print("error occured in search:\(error!.localizedDescription)")
            } else if response!.mapItems.count == 0 {
                print("There are no results")
            } else {
                print("Matches  found")
                
                for item in response!.mapItems {
                    
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = item.placemark.coordinate
                    annotation.title = item.name
                    self.mapView.addAnnotation(annotation)
                    
                }
            }
        }
        
    }
    
    //shows user location
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView] ) {
        //Adjusts Map Zoom
        if let annotationView = views.first {
            if let annotaion = annotationView.annotation {
                if annotaion is MKUserLocation {
                    let region = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.coordinate, 600, 600)
                    self.mapView.setRegion(region, animated: true)
                    
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier) == "ToAugmentedRealitySegue" {
            
        }
    }
    
    @IBAction func augmentReality(_ sender: Any) {
        //Segue to HDAugmentedRealityView
        performSegue(withIdentifier: "ToAugmentedRealitySegue", sender: nil)
    }
}
