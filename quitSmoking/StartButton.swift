//
//  StartButton.swift
//  quitSmoking
//
//  Created by Travis Kellar on 2015-04-08.
//  Copyright (c) 2015 Goran Pavlovic/Travis Kellar. All rights reserved.
//

import UIKit
import Foundation

class StartButton: UIButton {

    override func drawRect(rect: CGRect) {


        self.layer.cornerRadius = 10
        self.layer.borderWidth = 3
        //UIColor.greenColor().setFill()
        self.layer.backgroundColor = UIColor(red: 9/255, green: 24/255, blue: 189/255, alpha: 1.0).CGColor
        self.layer.borderColor = UIColor.grayColor().CGColor
        
        
    }
    
    
}
