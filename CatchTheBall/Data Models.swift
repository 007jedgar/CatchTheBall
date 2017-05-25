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
    private var locations = [BallInfo]()
    
}

class BallInfo {
    
    var latitude = CLLocationDegrees()
    var longitude = CLLocationDegrees()
    var loacationName = String()
    var locationDescription = String()
    
    init(latitude: CLLocationDegrees, longitude: CLLocationDegrees, locationName: String, locationDescription: String) {
        self.longitude = longitude
        self.latitude = latitude
        self.loacationName = locationName
        self.locationDescription = locationDescription
    }
}

