//
//  Timer_ViewController.swift
//  quitSmoking
//
//  Created by Goran Pavlovic on 2015-04-06.
//  Copyright (c) 2015 Goran Pavlovic/Travis Kellar. All rights reserved.
//

import UIKit

class Timer_ViewController: UIViewController {
    
    var quitTime : NSDate = NSDate()
    @IBOutlet var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTimer()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTimer() {
        var currentTime = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let unit:NSCalendarUnit = NSCalendarUnit.CalendarUnitDay
        let comp = calendar.components(unit, fromDate: quitTime, toDate: currentTime, options: nil)
        
        timerLabel.text = String(comp.day)
    }
    
    func resetTimer() {
        
    }
    
    func setQuitTime() {
        var currentTime = NSDate.timeIntervalSinceDate(quitTime)
        
        // Archive the currentTime as the quitTime
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
