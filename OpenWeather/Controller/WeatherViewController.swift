//
//  ViewController.swift
//  OpenWeather
//
//  Created by Kisacka on 18/09/2020.
//  Copyright © 2020 Kisacka. All rights reserved.
//

import UIKit
import CoreLocation //core location, where we are
import Alamofire
import SwiftyJSON


class WeatherViewController: UIViewController, CLLocationManagerDelegate, ChangeCityDelegate {

    
    //ChangeCityDelegate is our made protocol in ChangeCityViewController
    let weatherDataModel = WeatherDataModel()
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters // the more precize, the more time will take to load and will eat phone battery
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    //MARK: - Location Manager Delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1] //the last one
        
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            
            print("Longitude: \(location.coordinate.longitude), latitude: \(location.coordinate.latitude)")
            
            let latitude  = String(location.coordinate.latitude)
            let longitude  = String(location.coordinate.longitude)
            
            let params: [String: String] = ["lat": latitude, "lon": longitude, "appid": weatherDataModel.apiId] //dictionary of parameters
            getWeatherData(url: weatherDataModel.apiUrl, parameters: params)
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error:", error)
        cityLabel.text = "Weather unavailable 😕"
        
    }
    
    //MARK: - Networking
    func getWeatherData(url: String, parameters: [String : String]){
        //getting data based on location
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { (response) in
            
            if response.value != nil {
                print("Got weather data")
                let weatherJSON: JSON = JSON(response.value!)
                print("weatherJSON:", weatherJSON)
                
                self.updateWeatherData(json: weatherJSON)
                
            } else {
                print("Error: \(String(describing: response.error))")
                self.cityLabel.text = "Connection issues 😕"
                
            }
        }
    }
    
    //MARK: - JSON Parsing with SwiftyJSON
    //will help to get the data we need
    
    func updateWeatherData(json: JSON) {
        
        if let tempResult = json["main"]["temp"].double{
            weatherDataModel.temp = Int(tempResult - 273.15) // converting from double to int, and from kelvin to celsius
            weatherDataModel.city = json["name"].stringValue
            weatherDataModel.condition = json["weather"][0]["id"].intValue
            weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)
            
            updateUIWithWeatherData()
            
        } else {
            self.cityLabel.text = "Weather unavailable 😕"
        }
        
    }
    
    //MARK: - Update UI
    
    func updateUIWithWeatherData(){
        
        cityLabel.text = weatherDataModel.city
        tempLabel.text = ("\(weatherDataModel.temp)")
       // weatherIcon.image = UIImage(named: weatherDataModel.weatherIconName)
        weatherIcon.image = UIImage(systemName: weatherDataModel.weatherIconName)
        
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName" {
            let destinationVC = segue.destination as! ChangeCityViewController
            destinationVC.delegate = self // it will pass back what we are typing in text box
            
        }
    }
    
    
    
    
    //MARK: - ChangeCityDelegate Delegate
    
    func userEnteredNewCityName(city: String) {
        print(city)
        let params: [String: String] = ["q": city, "appid": weatherDataModel.apiId] 
        getWeatherData(url: weatherDataModel.apiUrl, parameters: params)
    
    }
    
    
    
    
    
}

