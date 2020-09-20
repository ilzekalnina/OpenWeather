//
//  AppInfoViewController.swift
//  OpenWeather
//
//  Created by Kisacka on 20/09/2020.
//  Copyright © 2020 Kisacka. All rights reserved.
//

import UIKit

class AppInfoViewController: UIViewController {

    @IBOutlet weak var appInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appInfoLabel.text = "It doesn't matter if it rains or snows, or sun is shining - \nthe weather outside is always beautiful! \n\nBut if you still want to know the temperature in your or other city, and aproximate weather conditions, \nthis weather app is for you!"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
