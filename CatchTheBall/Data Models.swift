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

    var loacationName = String()
    var locationDescription = String()
    
    init(locationName: String, locationDescription: String) {
        self.loacationName = locationName
        self.locationDescription = locationDescription
    }
}

