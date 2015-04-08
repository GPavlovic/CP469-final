//
//  buttonClass.swift
//  quitSmoking
//
//  Created by Travis Kellar on 2015-04-08.
//  Copyright (c) 2015 Goran Pavlovic/Travis Kellar. All rights reserved.
//

import UIKit
import Foundation

class buttonClass: UIButton {
    
    var green = false
    
    override func drawRect(rect: CGRect) {
        
        
        /*var path = UIBezierPath(ovalInRect: rect)
        UIColor.greenColor().setFill()
        path.fill()*/
        
        
        
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
       // UIColor.greenColor().setFill()
        self.layer.backgroundColor = UIColor(red: 168/255, green: 13/255, blue: 13/255, alpha: 0.75).CGColor
        self.layer.borderColor = UIColor.blackColor().CGColor
        
    }
    
    func changeColor(){
        
        Goals()
        
        
        if(green == true){
            green = false
            self.layer.backgroundColor = UIColor(red: 168/255, green: 13/255, blue: 13/255, alpha: 0.75).CGColor
            
            var s = self.titleLabel?.text
            Goals.removeInterest(s!)
            
        }
        else if(green == false){
            green = true
            self.layer.backgroundColor = UIColor(red: 22/255, green: 168/255, blue: 13/255, alpha: 0.75).CGColor
            var s = self.titleLabel?.text
            Goals.addInterest(s!)
        }
        
        
    }
    
    

}
