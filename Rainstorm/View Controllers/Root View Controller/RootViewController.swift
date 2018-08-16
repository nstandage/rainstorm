//
//  RootViewController.swift
//  Rainstorm
//
//  Created by Nathan Standage on 8/14/18.
//  Copyright © 2018 Nathan Standage. All rights reserved.
//

import UIKit

final class RootViewController: UIViewController {

    // MARK: - Properties
    
    private let dayViewController: DayViewController = {
        guard let dayViewController = UIStoryboard.main.instantiateViewController(withIdentifier: DayViewController.storyboardIdentifier) as? DayViewController else {
            fatalError("Unable to Instantiate Day View Controller")
        }
        
        // Configure Day View Controller
        dayViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return dayViewController
    }()
    
    private let weekViewController: WeekViewController = {
        guard let weekViewController = UIStoryboard.main.instantiateViewController(withIdentifier: WeekViewController.storyboardIdentifier) as? WeekViewController else {
            fatalError("Unable to Instantiate Week View Controller")
        }
        
        // Configure Day View Controller
        weekViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return weekViewController
    }()
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Setup Child View Controllers
        setupChildViewControllers()
        
        // Feth Weather Data
        fetchWeatherData()
    }

    
    private func setupChildViewControllers() {
        addChildViewController(dayViewController)
        addChildViewController(weekViewController)
        
        view.addSubview(dayViewController.view)
        view.addSubview(weekViewController.view)
        
        dayViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        dayViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        dayViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        dayViewController.view.heightAnchor.constraint(equalToConstant: Layout.DayView.height).isActive = true
        
        weekViewController.view.topAnchor.constraint(equalTo: dayViewController.view.bottomAnchor).isActive = true
        weekViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        weekViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        weekViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        dayViewController.didMove(toParentViewController: self)
        weekViewController.didMove(toParentViewController: self)
        
    }
    
    
    private func fetchWeatherData() {
        
        // Initialize Weather Request
        let weatherRequest = WeatherRequest(baseUrl: WeatherService.authenticatedBaseUrl, location: Defaults.location)
        
        // Create Data Task
        URLSession.shared.dataTask(with: weatherRequest.url) { (data, response, error) in
            if let error = error {
                print("Request Did Fail (\(error))")
            } else if let response = response {
                print(response)
            }

            
        }.resume()
    }
    
}


extension RootViewController {
    
    fileprivate enum Layout {
        enum DayView {
            static let height: CGFloat = 200.0
        }
        
    }
    
}














