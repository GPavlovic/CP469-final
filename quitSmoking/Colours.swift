//
//  Colours.swift
//  quitSmoking
//
//  Created by Travis Kellar on 2015-04-07.
//  Copyright (c) 2015 Goran Pavlovic/Travis Kellar. All rights reserved.
//

import UIKit

class Colours{
    
    
    //1st: let colorTop = UIColor(red: 245.0/255.0, green: 181/255.0, blue: 132.0/255.0, alpha: 1.0).CGColor
    let colorTop = UIColor(red: 218.0/255.0, green: 161/255.0, blue: 117.0/255.0, alpha: 1.0).CGColor
    let colorBottom = UIColor(red: 255.0/255.0, green: 244.0/255.0, blue: 236.0/255.0, alpha: 1.0).CGColor
    
    //black: let colorBottom = UIColor(red: 35.0/255.0, green: 2.0/255.0, blue: 2.0/255.0, alpha: 1.0).CGColor
    //white: let colorBottom = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).CGColor
    //orange : let colorBottom = UIColor(red: 255.0/255.0, green: 154.0/255.0, blue: 0.0/255.0, alpha: 1.0).CGColor
    
    //peach palette 1
    //let colorTop = UIColor(red: 243.0/255.0, green: 160/255.0, blue: 66.0/255.0, alpha: 1.0).CGColor
    //let colorBottom = UIColor(red: 255.0/255.0, green: 227.0/255.0, blue: 196.0/255.0, alpha: 1.0).CGColor
    
    let gl: CAGradientLayer
    
    init() {
        gl = CAGradientLayer()
        gl.colors = [ colorTop, colorBottom]
        gl.locations = [ 0.0, 1.5]
    }
    
}