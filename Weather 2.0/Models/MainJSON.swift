//
//  Models.swift
//  Weather 2.0
//
//  Created by Stefan Ruzic on 28.10.17..
//  Copyright © 2017. Stefan Ruzic. All rights reserved.
//

import Foundation


class MainJson: Codable {
    var humidity: Int = 0
    var pressure: Int = 0
    var current: Double = 0
    var tempMin: Double = 0
    var tempMax: Double = 0
    
    enum CodingKeys : String, CodingKey {
        case humidity = "humidity"
        case pressure = "pressure"
        case current = "temp"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
