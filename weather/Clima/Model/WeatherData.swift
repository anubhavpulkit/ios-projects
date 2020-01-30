//
//  weaterData.swift
//  Clima
//
//  Created by Anubhav Singh on 27/01/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather] //if what you want is not direct then make their Data type
    let wind: Wind
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let id: Int
    let description: String
}

struct Wind: Decodable{
    let speed: Double
}
