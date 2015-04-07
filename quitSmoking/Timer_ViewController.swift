//
//  Timer_ViewController.swift
//  quitSmoking
//
//  Created by Goran Pavlovic on 2015-04-06.
//  Copyright (c) 2015 Goran Pavlovic/Travis Kellar. All rights reserved.
//

import UIKit
import Foundation

class Timer_ViewController: UIViewController, NSCoding {
    
    var quitTime : NSDate!
    var userDidQuit = false
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var moneyLabel: UILabel!
    var avgPackPrice:Double!
    var packsPerDay:Int!
    var moneySaved = 0.00
    
    override func viewDidLoad() {
        let filePath = self.dataFilePath()
        
        super.viewDidLoad()

        if (NSFileManager.defaultManager().fileExistsAtPath(filePath)) {
            let data = NSMutableData(contentsOfFile: filePath)!
            let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
            // Get data
            quitTime = unarchiver.decodeObjectForKey("quitTimeKey") as NSDate
            userDidQuit = unarchiver.decodeBoolForKey("userQuitKey")
            avgPackPrice = unarchiver.decodeDoubleForKey("packPriceKey")
            packsPerDay = unarchiver.decodeIntegerForKey("packsPerDayKey")
            unarchiver.finishDecoding()
        }
        
        let app = UIApplication.sharedApplication()
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "applicationWillResignActive:",
            name: UIApplicationWillResignActiveNotification,
            object: app)
        // Start updating the timer
        update()
        NSTimer.scheduledTimerWithTimeInterval(10.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update() {
        if (userDidQuit) {
            var currentTime = NSDate()
            let calendar = NSCalendar.currentCalendar()
            // Days
            let unitDay:NSCalendarUnit = NSCalendarUnit.CalendarUnitDay
            let compDay = calendar.components(unitDay, fromDate: quitTime, toDate: currentTime, options: nil)
            // Hours
            let unitHour:NSCalendarUnit = NSCalendarUnit.CalendarUnitHour
            let compHour = calendar.components(unitHour, fromDate: quitTime, toDate: currentTime, options: nil)
            // Minutes
            let unitMin:NSCalendarUnit = NSCalendarUnit.CalendarUnitMinute
            let compMin = calendar.components(unitMin, fromDate: quitTime, toDate: currentTime, options: nil)
            
            timerLabel.text = String(compDay.day)+" days "+String(compHour.hour)+" hours "+String(compMin.minute)+" minutes"
            
            moneySaved = Double(compDay.day) * avgPackPrice * Double(packsPerDay)
            moneyLabel.text = String(format:"%.2f",moneySaved)+"$"
        }
    }
    
    @IBAction func resetTimer(sender: AnyObject) {
        userDidQuit = false
        timerLabel.text = "0 days 0 hours 0 minutes"
        moneyLabel.text = "0.00$"
    }
    
    @IBAction func startButtonPressed(sender: AnyObject) {
        println("YES")
        if (!userDidQuit) {
            println("yes")
            userDidQuit = true
            quitTime = NSDate()
            
            let message = "Congratulations on beginning the road to a healthier you!"
            let alert = UIAlertController (
                title: ":)",
                message: message,
                preferredStyle: .Alert)
            
            let startAction = UIAlertAction(title: "start", style: .Default) { (_) in
                let packPriceIN = alert.textFields![0] as UITextField
                let packNumIN = alert.textFields![1] as UITextField
                
                self.avgPackPrice = (packPriceIN.text as NSString).doubleValue
                self.packsPerDay = packNumIN.text.toInt()
            }
            
            alert.addTextFieldWithConfigurationHandler{ (textField) in
                textField.placeholder = "Average Pack Price ie. 10.25"
                textField.keyboardType = UIKeyboardType.DecimalPad
                NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: textField, queue: NSOperationQueue.mainQueue()) { (notification) in
                        startAction.enabled = textField.text != ""
                    }
            }
            alert.addTextFieldWithConfigurationHandler{ (textField) in
                textField.placeholder = "Average Packs per day ie. 2"
                textField.keyboardType = UIKeyboardType.DecimalPad
                NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: textField, queue: NSOperationQueue.mainQueue()) { (notification) in
                    startAction.enabled = textField.text != ""
                }
            }
            alert.addAction(startAction)
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func applicationWillResignActive(notification:NSNotification) {
        let filePath = self.dataFilePath()
        
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(self.quitTime, forKey: "quitTimeKey")
        archiver.encodeBool(self.userDidQuit, forKey: "userQuitKey")
        archiver.encodeDouble(self.avgPackPrice, forKey: "packPriceKey")
        archiver.encodeInteger(self.packsPerDay, forKey: "packsPerDayKey")
        archiver.finishEncoding()
        data.writeToFile(filePath, atomically: true)
    }
    
    func dataFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(
            NSSearchPathDirectory.DocumentDirectory,
            NSSearchPathDomainMask.UserDomainMask, true)
        let documentsDirectory = paths[0] as NSString
        return documentsDirectory.stringByAppendingPathComponent("data.archive") as String
    }
    
    override func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(quitTime, forKey:"quitTimeKey")
        coder.encodeBool(userDidQuit, forKey: "userQuitKey")
        coder.encodeDouble(avgPackPrice, forKey: "packPriceKey")
        coder.encodeInteger(packsPerDay, forKey: "packPerDayKey")
    }
    
    required init(coder decoder:NSCoder) {
        self.quitTime = decoder.decodeObjectForKey("quitTimeKey") as NSDate!
        self.userDidQuit = decoder.decodeBoolForKey("userQuitKey")
        self.avgPackPrice = decoder.decodeDoubleForKey("packPriceKey")
        self.packsPerDay = decoder.decodeIntegerForKey("packsPerDayKey")
        super.init(coder: decoder)
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
