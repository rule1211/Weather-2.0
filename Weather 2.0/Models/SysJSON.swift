//
//  SysJSON.swift
//  Weather 2.0
//
//  Created by Stefan Ruzic on 29.10.17..
//  Copyright © 2017. Stefan Ruzic. All rights reserved.
//

import Foundation

class SysJson: Codable {
    
    var type: Int = 0
    var id: Int = 0
    var country: String = ""
    var message: Double = 0
    var sunrise: Int = 0
    var sunset: Int = 0
    
    enum CodingKeys : String, CodingKey {
        case type = "type"
        case id = "id"
        case country = "country"
        case message = "message"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
}
