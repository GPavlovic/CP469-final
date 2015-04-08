//
//  OverviewLabels.swift
//  quitSmoking
//
//  Created by Travis Kellar on 2015-04-08.
//  Copyright (c) 2015 Goran Pavlovic/Travis Kellar. All rights reserved.
//

import UIKit
import Foundation

class OverviewLabels: UILabel {

    
    func changeText(s: String){
        
        self.text = s;
        
        
        self.layer.cornerRadius = 1
        self.layer.borderWidth = 3
        //UIColor.greenColor().setFill()
        self.layer.backgroundColor = UIColor(red: 57/255, green: 170/255, blue: 250/255, alpha: 0.7).CGColor
        self.layer.borderColor = UIColor.grayColor().CGColor
    }
    
    
}
