//
//  HeaderCells.swift
//  quitSmoking
//
//  Created by Travis Kellar on 2015-04-07.
//  Copyright (c) 2015 Goran Pavlovic/Travis Kellar. All rights reserved.
//

import UIKit

class HeaderCells: UITableViewCell {

    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var sectionLabel: UILabel!
    
    @IBAction func button(sender: AnyObject) {
        println("122")
        var goals = Goals();
        
        
        
        if(sectionLabel.text == "Current Goals" ){
            Goals.changeOpen(0)
        }
        else{
            Goals.changeOpen(1)
        }
        
       /* closeButton.setTitle("-", forState: UIControlState.Normal)
        
        if(closeButton.titleLabel?.text == "+"){
            closeButton.setTitle("-", forState: UIControlState.Normal)
            
            
        }
        else if(closeButton?.titleLabel?.text == "-"){
            closeButton?.setTitle("+", forState: UIControlState.Normal)
        }*/
    }
    
    
}