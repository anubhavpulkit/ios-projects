//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {

    @IBOutlet var searchTextField: UITextField!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        searchTextField.delegate = self// to use delegate for using go button from Keyboard
        
       
    }

    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
        searchTextField.endEditing(true) // end editing close keyboard after press search button
       
    }
    // Delegate method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true) // to dismiss keboard after press go
        return true
    }
    
    // Delegate method
    // to check weather user give i/p or not
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""
        {
            return true
        }
        else{ //if user not give i/p and tap go button then textField show enter something here
            textField.placeholder = "Enter something here"
            return false
        }
    }
    
    // Delegate method
   // to clear textField after press button
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text{
            weatherManager.fetchweather(cityname: city) //fetch the city name and use in weatherManager
        }
        searchTextField.text = "" // for clear the search bar after tap to search and go button
    }
    
    func didUpdateWeather(_ weatherManager:WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.tempratureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
        
    }
  
    func didFailWithError(error: Error) {
        print(error)
    }
}

