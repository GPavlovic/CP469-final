//
//  Craving_Controller.swift
//  quitSmoking
//
//  Created by Travis Kellar on 2015-04-07.
//  Copyright (c) 2015 Goran Pavlovic/Travis Kellar. All rights reserved.
//

import UIKit

class Craving_Controller: UIViewController {

    let colours = Colours()
    func refresh() {
        view.backgroundColor = UIColor.clearColor()
        var backgroundLayer = colours.gl
        backgroundLayer.frame = view.frame
        backgroundLayer.frame.inset(dx: 0, dy: -50)
        view.layer.insertSublayer(backgroundLayer, atIndex: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh();
        
    }
    
    

    
    
    
}
