//
//  WindJson.swift
//  Weather 2.0
//
//  Created by Stefan Ruzic on 29.10.17..
//  Copyright © 2017. Stefan Ruzic. All rights reserved.
//

import Foundation

class WindJson: Codable {
    var speed: Int = 0
    var deg: Int = 0
    
    enum CodingKeys : String, CodingKey {
        case speed = "speed"
        case deg = "deg"
    }
}
