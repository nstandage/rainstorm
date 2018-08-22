//
//  RootViewModel.swift
//  Rainstorm
//
//  Created by Nathan Standage on 8/16/18.
//  Copyright © 2018 Nathan Standage. All rights reserved.
//

import Foundation


class RootViewModel {
    
    // MARK: - Types
    
    enum WeatherDataError: Error {
        case noWeatherDataAvailable
    }
    
    // MARK: -  Type Aliases
    
    typealias DidFetchWeatherDataCompletion = (WeatherData?, WeatherDataError?) -> Void
    
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
            if let response = response  as? HTTPURLResponse {
                print("Status Code: \(response)")
            }
            
            DispatchQueue.main.async {
                if let error = error {
                    print("Unable to fetch weather data: \(error)")
                    self?.didFetchWeatherData?(nil, .noWeatherDataAvailable)
                } else if let data = data {
                    let decoder = JSONDecoder()
                    
                    decoder.dateDecodingStrategy = .secondsSince1970
                    
                    do {
                        let darkSkyResponse = try decoder.decode(DarkSkyResponse.self, from: data)
                        self?.didFetchWeatherData?(darkSkyResponse, nil)
                        
                    } catch {
                        print("Unable to Decode JSON Response: \(error)")
                        self?.didFetchWeatherData?(nil, .noWeatherDataAvailable)
                    }
                    
                } else {
                    self?.didFetchWeatherData?(nil, nil)
                }
            }
            }.resume()
    } 
}
