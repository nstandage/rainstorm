//
//  RootViewModel.swift
//  Rainstorm
//
//  Created by Nathan Standage on 8/16/18.
//  Copyright © 2018 Nathan Standage. All rights reserved.
//

import Foundation


class RootViewModel {
    
    // MARK: -  Type Aliases
    
    typealias DidFetchWeatherDataCompletion = (Data?, Error?) -> Void
    
    // MARK: -  Properties
    
    var didFetchWeatherData: DidFetchWeatherDataCompletion?
    
    // MARK: -  Initiazation
    
    init() {
        fetchWeatherData()
    }
    
    // MARK: -  Helper Methods
    
    private func fetchWeatherData() {
        
        // Initialize Weather Request
        let weatherRequest = WeatherRequest(baseUrl: WeatherService.authenticatedBaseUrl, location: Defaults.location)
        
        // Create Data Task
        URLSession.shared.dataTask(with: weatherRequest.url) { [weak self] (data, response, error) in
            if let error = error {
                self?.didFetchWeatherData?(nil, error)
            } else if let data = data {
                self?.didFetchWeatherData?(data, nil)
            } else {
                self?.didFetchWeatherData?(nil, nil)
            }
            
            }.resume()
    } 
}
