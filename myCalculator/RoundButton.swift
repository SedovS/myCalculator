//
//  RoundButton.swift
//  myCalculator
//
//  Created by Apple on 21.05.2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var rooundButton:Bool = false {
        didSet {
            if rooundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if rooundButton {
            layer.cornerRadius = frame.height / 2
        }
    }
}
