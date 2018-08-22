//
//  DayViewModel.swift
//  Rainstorm
//
//  Created by Nathan Standage on 8/20/18.
//  Copyright © 2018 Nathan Standage. All rights reserved.
//

import Foundation
import UIKit


struct DayViewModel {
    
    let weatherData: CurrentWeatherConditions
    
    private let dateFormatter = DateFormatter()
    
    var date: String {
        // Configure Date Formatter
        dateFormatter.dateFormat = "EEE, MMMM d YYYY"
        
        // Convert Date to String
        return dateFormatter.string(from: weatherData.time)
        
    }
    
    var time: String {
        // Configure Date Formatter
        dateFormatter.dateFormat = "hh:mm a"
        
        // Convert Date to String
        return dateFormatter.string(from: weatherData.time)
    }
    
    var summary: String {
        return weatherData.summary
    }
    
    var temperature: String {
        return String(format: "%.1f °F", weatherData.temperature)
    }
    
    var windSpeed: String {
        return String(format: "%.f MPH", weatherData.windSpeed)
    }
    var image: UIImage? {
        return UIImage.imageForIcon(with: weatherData.icon)
    }
    
    
}
