//
//  WeatherJSON.swift
//  Weather 2.0
//
//  Created by Stefan Ruzic on 29.10.17..
//  Copyright © 2017. Stefan Ruzic. All rights reserved.
//

import Foundation

class WeatherJson: Codable {
    var id: Int = 0
    var main: String = ""
    var someText: String = ""
    var icon: String = ""
    
    enum CodingKeys : String, CodingKey {
        case id = "id"
        case main = "main"
        case someText = "description"
        case icon = "icon"
    }
    
}
