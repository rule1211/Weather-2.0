//
//  CurrentWeather.swift
//  Weather 2.0
//
//  Created by Stefan Ruzic on 13.10.17..
//  Copyright © 2017. Stefan Ruzic. All rights reserved.
//

import Foundation

class CurrentWeather: Codable {
    
    var mainJson        = MainJson()
    var temperature: Temperature?
    var weatherJson     = [WeatherJson]()
    var windJson        = WindJson()
    var dateTime        = Date()
    var name            = ""
    var visibility: Int = 0

    
    enum CodingKeys : String, CodingKey {
        case dateTime           = "dt"
        case mainJson           = "main"
        case name               = "name"
        case weatherJson        = "weather"
        case windJson           = "wind"
        case visibility         = "visibility"
        case temperature        = "temp"
        
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        weatherJson     = try container.decode([WeatherJson].self, forKey: .weatherJson)
        
        if let main = try container.decodeIfPresent(MainJson.self, forKey: .mainJson) {
            mainJson = main
        }
        if let temp = try container.decodeIfPresent(Temperature.self, forKey: .temperature) {
            temperature = temp
        }
        if let wind = try container.decodeIfPresent(WindJson.self, forKey: .windJson) {
            windJson = wind
        }
    
        if let myName = try container.decodeIfPresent(String.self, forKey: .name) {
            name = myName
        }
        dateTime        = try container.decode(Date.self, forKey: .dateTime)

        if let myVisibility = try container.decodeIfPresent(Int.self, forKey: .visibility) {
            visibility = myVisibility
        }
        
    }
}

struct Temperature: Codable {
    var day: Double
    var min: Double
    var max: Double
    var night: Double
    var eve: Double
    var morn: Double
}
struct Weather: Codable {
    var id: Double
    var main: String
    var description: String
    var icon: String
}

