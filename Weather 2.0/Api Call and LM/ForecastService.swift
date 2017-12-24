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
    let APIKey = "bc5b6df3749d8a2defddd5126af77cd8"
    let baseUrl = "https://api.openweathermap.org/data/2.5/"
    static let sharedInstance = ForecastService()
    let appid: String
    let units: String
    // MARK:- Init ForcastService
    init() {
        appid = "&appid=\(APIKey)"
        units = "&units=metric"
    }
    // MARK:- GetCurrentWeather
    func getCurrentWeatherFor(city: String, completionHandler: @escaping (CurrentWeather) -> Void ) {
        
        let url = URL(string: "\(baseUrl)weather?q=\(city.replacingOccurrences(of: " ", with: "%20"))\(appid)\(units)")
        print(url!)
        Alamofire.request(url!).responseData { (dataResponce) in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            let currentWeather = try! decoder.decode(CurrentWeather.self, from: dataResponce.data!)
            completionHandler(currentWeather)
        }
    }
    
    func getForecastFor(city: String, completionHandler: @escaping ([CurrentWeather]) -> Void ) {
        let url = URL(string: "\(baseUrl)forecast/daily?q=\(city.replacingOccurrences(of: " ", with: "%20"))\(appid)\(units)")
        print(url!)
        var weatherArray = [CurrentWeather]()
        
        Alamofire.request(url!).responseJSON { (jsonData) in
            
            let jsonDict = jsonData.result.value as! [String : Any]
            let list = jsonDict["list"]! as! [[String : Any]]
            
            for item in list{
                let data = self.jsonToData(json: item)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                let currentWeather = try! decoder.decode(CurrentWeather.self, from: data!)
                weatherArray.append(currentWeather)
            }
            completionHandler(weatherArray)
        }
    }
    
    // Convert from NSData to json object
    func dataToJSON(data: Data) -> Any? {
        do {
            return try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as AnyObject
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil
    }
    
    // Convert from JSON to nsdata
    func jsonToData(json: Any) -> Data?{
        do {
            return try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil;
    }
}


extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    var cleanValue: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

