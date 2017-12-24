//
//  WindJson.swift
//  Weather 2.0
//
//  Created by Stefan Ruzic on 29.10.17..
//  Copyright © 2017. Stefan Ruzic. All rights reserved.
//

import Foundation

class WindJson: Codable {
    var speed:   Double = 0.0
    var degrees: Double = 0.0
    
    enum CodingKeys : String, CodingKey {
        case speed = "speed"
        case degrees = "deg"
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let speed = try container.decodeIfPresent(Double.self, forKey: .speed){
            self.speed = speed
        }
        if let degrees1 = try container.decodeIfPresent(Double.self, forKey: .degrees){
            self.degrees = degrees1
        }
    }
}
