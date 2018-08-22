//
//  WeekViewController.swift
//  Rainstorm
//
//  Created by Nathan Standage on 8/14/18.
//  Copyright © 2018 Nathan Standage. All rights reserved.
//

import UIKit

class WeekViewController: UIViewController {

    
    var viewModel: WeekViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            
            // Setup View Model
            setupViewModel(with: viewModel)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup View
        setupView()
    }

    
    // MARK: - Helper Methods
    
    private func setupView() {
        // Configure View
        view.backgroundColor = .red
    }
    
    private func setupViewModel(with viewModel: WeekViewModel) {
        print(viewModel)
    }

}
