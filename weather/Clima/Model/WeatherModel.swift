//
//  WeatherModel.swift
//  Clima
//
//  Created by Anubhav Singh on 30/01/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temprature: Double
    
    var tempratureString: String{  // computed prop
        return String(format: "%.1f", temprature) // for temp to be string and upto 1 decimal place
    }
    
    var conditionName: String{  //computed property
        
        switch conditionId {
        case 200...232:
          return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
            
        default:
          return "cloud"
        }

    }
    
    
    
}
