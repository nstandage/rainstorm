//
//  DayViewController.swift
//  Rainstorm
//
//  Created by Nathan Standage on 8/14/18.
//  Copyright © 2018 Nathan Standage. All rights reserved.
//

import UIKit

final class DayViewController: UIViewController {

    
    // MARK: - IBOutlets
    
    @IBOutlet var dateLabel: UILabel! {
        didSet {
            dateLabel.textColor = Styles.Colors.baseTextColor
            dateLabel.font = Styles.Fonts.heavyLarge
        }
    }
    
    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var iconImageView: UIImageView! {
        didSet {
            iconImageView.contentMode = .scaleAspectFit
            iconImageView.tintColor = Styles.Colors.baseTintColor
        }
    }
    
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var smallLabels: [UILabel]! {
        didSet {
            for label in regularLabels {
                label.textColor = .black
                label.font = Styles.Fonts.lightSmall
            }
        }
    }
    
    @IBOutlet var regularLabels: [UILabel]! {
        didSet {
            for label in regularLabels {
                label.textColor = .black
                label.font = Styles.Fonts.lightRegular
            }
        }
    }
    
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView! {
        didSet {
            activityIndicatorView.startAnimating()
            activityIndicatorView.hidesWhenStopped = true
        }
    }
    
    var viewModel: DayViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            
            // Setup View Model
            setupViewModel(with: viewModel)
        }
    }
    
    @IBOutlet var weatherDataViews: [UIView]! {
        didSet {
            for view in weatherDataViews {
                view.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup View
        setupView()
    }


    
    // MARK: - Helper Methods
    
    private func setupView() {
        //configure view
        view.backgroundColor = .green
    }

    private func setupViewModel(with viewModel: DayViewModel) {
        
        activityIndicatorView.stopAnimating()
        
        // Configure Labels
        dateLabel.text = viewModel.date
        timeLabel.text = viewModel.time
        windSpeedLabel.text = viewModel.windSpeed
        temperatureLabel.text = viewModel.temperature
        descriptionLabel.text = viewModel.summary
        
        // Configure Icon Image View
        iconImageView.image = viewModel.image
        
        // Show Weather Data Views
        for view in weatherDataViews {
            view.isHidden = false
        }
    }
    
}

