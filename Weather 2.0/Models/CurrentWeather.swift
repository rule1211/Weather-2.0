//
//  CurrentWeather.swift
//  Weather 2.0
//
//  Created by Stefan Ruzic on 13.10.17..
//  Copyright © 2017. Stefan Ruzic. All rights reserved.
//

import Foundation

class CurrentWeather: Codable {
    var dateTime = Date()
    var mainJson = MainJson()
    var name: String = ""
    var weatherJson = WeatherJson()
    var baseJson = BaseJson()
    var windJson = WindJson()
    var cloudsJson = CloudsJson()
    var dateTimeJson = DateTimeJson()
    var sysJson = SysJson()
    var idJson = IdJson()
    var nameJson = NameJson()
    var codJson = CodJson()
    
    enum CodingKeys : String, CodingKey {
        case dateTime = "dt"
        case mainJson = "main"
        case name = "name"
        case weatherJson = "weather"
        case baseJson = "base"
        case windJson = "wind"
        case cloudsJson = "clouds"
        case dateTimeJson = " dt "
        case sysJson = "sys"
        case idJson = "id"
        case nameJson = " name "
        case codJson = "cod"
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name        = try container.decode(String.self, forKey: .name)
        mainJson = try container.decode(MainJson.self, forKey: .mainJson)
        dateTime    = try container.decode(Date.self, forKey: .dateTime)
        weatherJson = try container.decode(WeatherJson.self, forKey: .weatherJson)
        baseJson = try container.decode(BaseJson.self, forKey: .baseJson)
        windJson = try container.decode(WindJson.self, forKey: .windJson)
        cloudsJson = try container.decode(CloudsJson.self, forKey: .cloudsJson)
        dateTimeJson = try container.decode(DateTimeJson.self, forKey: .dateTimeJson)
        sysJson = try container.decode(SysJson.self, forKey: .sysJson)
        idJson = try container.decode(IdJson.self, forKey: .idJson)
        nameJson = try container.decode(NameJson.self, forKey: .nameJson)
        codJson = try container.decode(CodJson.self, forKey: .codJson)


    }
}
