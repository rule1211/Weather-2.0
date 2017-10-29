//
//  ViewController.swift
//  Weather 2.0
//
//  Created by Stefan Ruzic on 11.10.17..
//  Copyright © 2017. Stefan Ruzic. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation


class ViewController: UIViewController {
    
    // MARK:- Current Weather,Date and Time Label
    @IBOutlet weak var currentCityLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentIconImage: UIImageView!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentWindspeedLabel: UILabel!
    @IBOutlet weak var currentVisibilityLabel: UILabel!
    @IBOutlet weak var currentPressureLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var currentTime = Date()
    let date = NSDate()
    let formatter = DateFormatter()
    var currentCity = "Belgrade"

    
    // MARK:- ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        currentCity = "Belgrade"
        
        // MARK:- Format Date and Time
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        timeLabel.text = "\(dateFormatter.string(from: currentTime))"
        formatter.dateFormat = "dd/M/yyyy" 
        dateLabel.text = formatter.string(from: date as Date)
        loadData()
        
        
        
    }
    // MARK:- LoadData
    func loadData(){
        ForecastService.sharedInstance.getCurrentWeatherFor(city: "Belgrade") { result in
            
            self.currentTemperatureLabel.text = "\(Int(result.mainJson.current.rounded()))"
            self.currentHumidityLabel.text = "\(result.mainJson.humidity)"
        }
    }
}

