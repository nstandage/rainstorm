//
//  WeatherRequest.swift
//  Rainstorm
//
//  Created by Nathan Standage on 8/15/18.
//  Copyright © 2018 Nathan Standage. All rights reserved.
//

import Foundation
import CoreLocation


struct WeatherRequest {
    
    let baseUrl: URL
    
    let location: CLLocation
    
    private var latitude: Double {
        return location.coordinate.latitude
    }
    private var longitude: Double {
        return location.coordinate.longitude
    }
 
    var url: URL {
        return baseUrl.appendingPathComponent("\(latitude), \(longitude)")
    }
}

