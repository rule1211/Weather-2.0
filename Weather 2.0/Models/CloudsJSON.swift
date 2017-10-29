//
//  CloudsJson.swift
//  Weather 2.0
//
//  Created by Stefan Ruzic on 29.10.17..
//  Copyright © 2017. Stefan Ruzic. All rights reserved.
//

import Foundation

class CloudsJson: Codable {
    var all: Int = 0
    
    enum CodingKeys : String, CodingKey {
        case all = "all"
    }
}
