//
//  Data Models.swift
//  CatchTheBall
//
//  Created by Jonathan Edgar on 4/25/17.
//  Copyright © 2017 Jonathan Edgar. All rights reserved.
//

import Foundation

import MapKit
class UserData {
    
    private var username : String?
    private var ballsCaught: Int?
    private var locations = [String]()
    
}

class ballInfo {
    
    private var latitude: CLLocationDegrees?
    private var longitude: CLLocationDegrees?
    
    
    init(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        self.longitude = longitude
        self.latitude = latitude
    }
}

class moreBallInfo {
    
    private var coordinates: CLLocationCoordinate2D?
    
}
