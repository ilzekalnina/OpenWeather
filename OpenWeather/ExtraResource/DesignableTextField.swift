//
//  DesignableTextField.swift
//  OpenWeather
//
//  Created by Kisacka on 20/09/2020.
//  Copyright © 2020 Kisacka. All rights reserved.
//

import UIKit
@IBDesignable
class DesignableTextField: UITextField {
    //after assigning this DesignableTextField class in inspector for the textfield, will be possible to set the properties like - round corners, image in left side of text box etc.
    
    //border with, color and cornerRadius
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    
    //setting image in left side
    @IBInspectable var leftImage : UIImage? {
        didSet{
            updateView()
        }
    }
    @IBInspectable var leftPadding: CGFloat = 0{
        didSet{
            updateView()
        }
    }
    func updateView() {
        if let image = leftImage {
            leftViewMode = .always
            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 24, height: 24))
            imageView.image = image
            imageView.tintColor = tintColor
            var width = leftPadding + 25
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
                width = width + 5
            }
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 24))
            view.addSubview(imageView)
            leftView = view
            
        }else{
            leftViewMode = .never
        }
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! : "", attributes: [NSAttributedString.Key.foregroundColor: tintColor!])    }
}
