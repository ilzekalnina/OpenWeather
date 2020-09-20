//
//  WeatherDataModel.swift
//  OpenWeather
//
//  Created by Kisacka on 19/09/2020.
//  Copyright © 2020 Kisacka. All rights reserved.
//

import Foundation

class WeatherDataModel {
    
    let apiUrl = "https://api.openweathermap.org/data/2.5/weather"
    let apiId = "68c9d19f811ac5b5f608a20628e0a027"
    
    var temp: Int = 0
    var condition: Int = 0 //weather id from openweathermap data
    var city:String = ""
    var weatherIconName:String = ""
    
    func updateWeatherIcon(condition: Int) -> String {
        switch (condition) {
        case 0...300 :
            return "cloud.sun.bolt"
        case 301...500 :
            return "cloud.sun.rain"
        case 501...600 :
            return "cloud.heavyrain"
        case 601...700 :
            return "cloud.snow"
        case 701...771 :
            return "cloud.fog"
        case 772...799 :
            return "cloud.bolt.rain"
        case 800 :
            return "sun.max"
        case 801...804 :
            return "cloud.sun"
        case 900...903, 905...1000  :
            return "cloud.bolt.rain"
        case 903 :
            return "cloud.sleet"
        case 904 :
            return "sun.max"
        default :
            return "questionmark"
        }
    }
    
}
