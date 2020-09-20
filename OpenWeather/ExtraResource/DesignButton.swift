//
//  DesignButton.swift
//  OpenWeather
//
//  Created by Kisacka on 20/09/2020.
//  Copyright © 2020 Kisacka. All rights reserved.
//

import UIKit
@IBDesignable class DesignButton: BounceButton {
    //after assigning in inspector this DesignButton class for the button, there will be possible to set corner radius and border properties
    
    @IBInspectable var borderWith: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWith
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear { //this is default value
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 { //this is default value
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
}
