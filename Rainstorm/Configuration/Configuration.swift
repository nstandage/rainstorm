//
//  Configuration.swift
//  Rainstorm
//
//  Created by Nathan Standage on 8/15/18.
//  Copyright © 2018 Nathan Standage. All rights reserved.
//

import Foundation
import CoreLocation


enum Defaults {
 
    static let location = CLLocation(latitude: 37.335114, longitude: -122.008928)
}

enum WeatherService {
    private static let apiKey = "96c7c519d79b4f5a433a721294124760"
    private static let baseUrl = URL(string: "https://api.darksky.net/forcast/")!
    
    static var authenticatedBaseUrl: URL {
        return baseUrl.appendingPathComponent(apiKey)
    }
}


