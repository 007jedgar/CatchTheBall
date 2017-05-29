//
//  ARViewController.swift
//  CatchTheBall
//
//  Created by Jonathan Edgar on 5/25/17.
//  Copyright © 2017 Jonathan Edgar. All rights reserved.
//

import UIKit
import HDAugmentedReality
import MapKit

class AugmentedRView: ARAnnotationView, MKMapViewDelegate, CLLocationManagerDelegate {

    var locationManager = CLLocationManager()
    var annotationView :UIView = UIView()
    var annotationNameLabel :UILabel = UILabel()
    var annotationAddressLabel :UILabel = UILabel()
    var annotationDistanceLabel :UILabel = UILabel()
    
        // Do any additional setup after loading the view.
    
    
    convenience init(annotation : ARAnnotation) {
        self.init()
        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        let userLatitude = self.locationManager.location?.coordinate.latitude
        let userLongitude = self.locationManager.location?.coordinate.longitude
        
        //let nearMeAnnotation = annotation as! NearMeAnnotation
        
        let userLocation = CLLocation(latitude: userLatitude!, longitude: userLongitude!)
        
        let name = "Ball"
        let address = "Cheers"
        
        let distanceInMilesRounded = "idk, Just go catch the ball"
        
        self.annotationView.frame = CGRect(x: 0, y: 0, width: 150, height: 100)
        self.annotationView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        
        self.annotationNameLabel.frame = CGRect(x: 0, y: 5, width: 150, height: 20)
        self.annotationNameLabel.text = name
        self.annotationNameLabel.textColor = UIColor.white
        self.annotationNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        self.annotationNameLabel.textAlignment = .center
        self.annotationNameLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.annotationNameLabel.numberOfLines = 2
        
        self.annotationAddressLabel.frame = CGRect(x: 0, y: self.annotationNameLabel.frame.size.height + 3, width: 150, height: 50)
        
        self.annotationAddressLabel.text = address
        self.annotationAddressLabel.textColor = UIColor.white
        self.annotationAddressLabel.font = UIFont.boldSystemFont(ofSize: 13)
        self.annotationAddressLabel.textAlignment = .center
        self.annotationAddressLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.annotationAddressLabel.numberOfLines = 2
        
        self.annotationDistanceLabel.frame = CGRect(x: 0, y: self.annotationAddressLabel.frame.size.height + 2, width: 250, height: 50)
        self.annotationDistanceLabel.text = "\(distanceInMilesRounded) Miles"
        self.annotationDistanceLabel.textColor = UIColor.white
        self.annotationDistanceLabel.font = UIFont.boldSystemFont(ofSize: 13)
        self.annotationDistanceLabel.textAlignment = .center
        
        self.annotationView.addSubview(self.annotationNameLabel)
        self.annotationView.addSubview(self.annotationAddressLabel)
        self.annotationView.addSubview(self.annotationDistanceLabel)
        self.annotationView.addSubview(self.annotationView)
        //self.addSubview(self.annotationView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}



