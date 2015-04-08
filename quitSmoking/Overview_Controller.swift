//
//  Overview_Controller.swift
//  quitSmoking
//
//  Created by Travis Kellar on 2015-04-07.
//  Copyright (c) 2015 Goran Pavlovic/Travis Kellar. All rights reserved.
//

import UIKit

class Overview_Controller: UIViewController {

    
    let colours = Colours()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh();
    }
    
    func refresh() {
        view.backgroundColor = UIColor.clearColor()
        var backgroundLayer = colours.gl
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, atIndex: 0)
    }
    }


    
    
    
    /*extension UIView {
        func layerGradient() {
            let layer : CAGradientLayer = CAGradientLayer()
            layer.frame.size = self.frame.size
            layer.frame.origin = CGPointMake(0.0,0.0)
            layer.cornerRadius = CGFloat(frame.width / 20)
            
            let color0 = UIColor(red:250.0/255, green:250.0/255, blue:250.0/255, alpha:0.5).CGColor
            let color1 = UIColor(red:200.0/255, green:200.0/255, blue: 200.0/255, alpha:0.1).CGColor
            let color2 = UIColor(red:150.0/255, green:150.0/255, blue: 150.0/255, alpha:0.1).CGColor
            let color3 = UIColor(red:100.0/255, green:100.0/255, blue: 100.0/255, alpha:0.1).CGColor
            let color4 = UIColor(red:50.0/255, green:50.0/255, blue:50.0/255, alpha:0.1).CGColor
            let color5 = UIColor(red:0.0/255, green:0.0/255, blue:0.0/255, alpha:0.1).CGColor
            let color6 = UIColor(red:150.0/255, green:150.0/255, blue:150.0/255, alpha:0.1).CGColor
            
            layer.colors = [color0,color1,color2,color3,color4,color5,color6]
            self.layer.insertSublayer(layer, atIndex: 0)
        }
    }*/
    

