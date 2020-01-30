//
//  File.swift
//  Clima
//
//  Created by Anubhav Singh on 26/01/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager:WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
   
}

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=6a6c3b4e37ca175d97befb7a4e67b15d&units=metric"
    
    var delegate:  WeatherManagerDelegate?
    
    //take input city from delrgate method and complete the URL
    func fetchweather(cityname: String) {
        let urlString = "\(weatherURL)&q=\(cityname)"
       // print(urlString)
        performRequest(with: urlString)
    }
    
    
    // NETWORKING
    
    func performRequest(with urlString: String) {
        
        // 1.create a URL
        if let url = URL(string: urlString){ //we use if because URL is optional
            
            // 2.create a URL session
            let session = URLSession(configuration: .default)
            
            
            // 3.give the session a task *** imp
            let task = session.dataTask(with: url) { (data, responce, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                 if let weather = self.parseJSON(safeData) //give data to ParseJSON to decode
                   {
                    self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            //4.Start task
            task.resume()
            
            
        }
        
    }
    // to get data from task and decode and gove result
    func parseJSON(_ weatherData: Data) -> WeatherModel?{
       let decoder = JSONDecoder() //make a decoder to decode the data (from JSONDecoder)
        do{
         let decodedData = try decoder.decode(WeatherData.self, from: weatherData) //decoded data using JSONDecoder
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temprature: temp)
            
            print(weather.tempratureString)
            
            return weather
            
        }
        catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    
   
    
}
