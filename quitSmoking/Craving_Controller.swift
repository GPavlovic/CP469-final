//
//  Craving_Controller.swift
//  quitSmoking
//
//  Created by Travis Kellar on 2015-04-07.
//  Copyright (c) 2015 Goran Pavlovic/Travis Kellar. All rights reserved.
//

import UIKit

class Craving_Controller: UIViewController {

    
    @IBOutlet weak var NHL_button: UIButton!
    
    /*@IBOutlet weak var Music_button: UIButton!
    
    @IBOutlet weak var Movies_button: UIButton!
    
    
    @IBOutlet weak var NFL_button: UIButton!
    
    @IBOutlet weak var Cars_button: UIButton!
    
    @IBOutlet weak var Tech_button: UIButton!
    */
    
    @IBOutlet weak var title_Label: UILabel!
    
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
 
        println("BUTTON");
        //NHL_button?.backgroundColor = UIColor.clearColor()
        title_Label.layer.borderWidth = 2
        title_Label.layer.borderColor = UIColor.blackColor().CGColor
        
    }
    
    
    @IBAction func buttonPressed(sender: buttonClass) {
        
        sender.changeColor()
        
        /*
        if(sender.backgroundColor == UIColor.redColor()){
            sender.backgroundColor = UIColor.greenColor()}
        else if(sender.backgroundColor == UIColor.greenColor()){
            sender.backgroundColor = UIColor.redColor()
        }*/
        
        
    }

    
    
    
}
