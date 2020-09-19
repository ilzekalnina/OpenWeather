//
//  ChangeCityViewController.swift
//  OpenWeather
//
//  Created by Kisacka on 19/09/2020.
//  Copyright © 2020 Kisacka. All rights reserved.
//

import UIKit


protocol ChangeCityDelegate {
    
    func userEnteredNewCityName(city: String)
    
}

class ChangeCityViewController: UIViewController {
    
    var delegate: ChangeCityDelegate? //optional
    
    @IBOutlet weak var cityTextField: UITextField!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
    
    @IBAction func getWeatherTapped(_ sender: Any) {
        guard let cityName = cityTextField.text else {
            return
        }
        delegate?.userEnteredNewCityName(city: cityName)
        self.dismiss(animated: true, completion: nil) // dismiss this viewcontroller
    }

}
