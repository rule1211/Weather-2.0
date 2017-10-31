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
    var weatherJson     = [WeatherJson]()
    var windJson        = WindJson()
    var cloudsJson      = CloudsJson()
    var sysJson         = SysJson()
    var dateTime        = Date()
    var name            = ""
    var base            = ""
    var visibility: Int = 0
    var id: Int         = 0
    var cod: Int        = 0
    
    enum CodingKeys : String, CodingKey {
        case dateTime           = "dt"
        case mainJson           = "main"
        case name               = "name"
        case weatherJson        = "weather"
        case base               = "base"
        case windJson           = "wind"
        case cloudsJson         = "clouds"
        case sysJson            = "sys"
        case id                 = "id"
        case cod                = "cod"
        case visibility         = "visibility"
        
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        weatherJson     = try container.decode([WeatherJson].self, forKey: .weatherJson)
        mainJson        = try container.decode(MainJson.self, forKey: .mainJson)
        windJson        = try container.decode(WindJson.self, forKey: .windJson)
        cloudsJson      = try container.decode(CloudsJson.self, forKey: .cloudsJson)
        sysJson         = try container.decode(SysJson.self, forKey: .sysJson)
        name            = try container.decode(String.self, forKey: .name)
        dateTime        = try container.decode(Date.self, forKey: .dateTime)
        base            = try container.decode(String.self, forKey: .base)
        id              = try container.decode(Int.self, forKey: .id)
        cod             = try container.decode(Int.self, forKey: .cod)
        visibility      = try container.decode(Int.self, forKey: .visibility)



    }
}
