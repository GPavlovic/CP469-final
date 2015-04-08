//
//  nextButtons.swift
//  quitSmoking
//
//  Created by Travis Kellar on 2015-04-08.
//  Copyright (c) 2015 Goran Pavlovic/Travis Kellar. All rights reserved.
//

import UIKit
import Foundation

class nextButtons: UIButton {

    
    
    override func drawRect(rect: CGRect) {
        
        
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 3
        //UIColor.greenColor().setFill()
        self.layer.backgroundColor = UIColor(red: 168/255, green: 13/255, blue: 13/255, alpha: 0.75).CGColor
        self.layer.borderColor = UIColor.grayColor().CGColor
        
        
    }
    func start(){
        self.titleLabel?.text = "NEXT"
        
        self.layer.backgroundColor = UIColor(red: 9/255, green: 189/255, blue: 33/255, alpha: 0.7).CGColor
        
        
    }
}
