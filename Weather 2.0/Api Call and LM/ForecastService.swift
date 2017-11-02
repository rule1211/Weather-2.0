//
//  ForecastService.swift
//  Weather 2.0
//
//  Created by Stefan Ruzic on 12.10.17..
//  Copyright © 2017. Stefan Ruzic. All rights reserved.
//

import Foundation
import Alamofire

class ForecastService {

    // MARK:- ForcastService
    let forecastBaseURL: URL?
    let APIKey = "bc5b6df3749d8a2defddd5126af77cd8"
    let baseUrl = "https://api.openweathermap.org/data/2.5/weather?q="
    static let sharedInstance = ForecastService()
    
    // MARK:- Init ForcastService
    init() {
        forecastBaseURL = URL(string: "\(baseUrl)\(self.APIKey)")
    }
    // MARK:- GetCurrentWeather
    func getCurrentWeatherFor(city: String, completionHandler: @escaping (CurrentWeather) -> Void ) {
        let url = URL(string: "\(baseUrl)\(city.replacingOccurrences(of: " ", with: ""))&appid=\(APIKey)&units=metric")
        print(url!)
        Alamofire.request(url!).responseData { (dataResponce) in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            let currentWeather = try! decoder.decode(CurrentWeather.self, from: dataResponce.data!)
            completionHandler(currentWeather)
        }
    }
}
