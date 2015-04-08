//
//  Distraction_View.swift
//  quitSmoking
//
//  Created by Travis Kellar on 2015-04-08.
//  Copyright (c) 2015 Goran Pavlovic/Travis Kellar. All rights reserved.
//

import UIKit
import Foundation

class Distraction_View: UIViewController, NSXMLParserDelegate{

    

    @IBOutlet var webView: UIWebView!
    
    
    
    var dataStore = NSMutableData()      // to store the complete rss feed
    var parser = NSXMLParser()
    var currentElement = ""         // contains the element currently parsed by NSXMLParser
    var processingItem : Bool?      // delete the "?", understand why there would be an error, set to true if the parser is processing the element "item"
    var itemsArray: [String] = []   // to store the parsed items from the feed
    
    override func viewDidLoad() {
        
        
        
        
        super.viewDidLoad()
        var goals = Goals()
        processingItem = false
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        

        getPages()
        
        
    }
    
    func getPages(){
        
        //GET URL FROM GOALS, DEPENDING ON INTEREST(RANDOM)
        
           
        for(var i = 0; i < Goals.interestCount();i++){
            let urlPath: String = Goals.getFeed(i)
            var new_p = New_Parsers()
            new_p.start(urlPath)
        }
        
            
        
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showPage(){
        
        var url = "-1";
        
        
        url = Goals.getLink()
        
        if(url != "-1"){
            let requestURL = NSURL(string:url)
            let request = NSURLRequest(URL: requestURL!)
            webView.scalesPageToFit = true
            webView.loadRequest(request)
        }
        
        
    }
    
    
    @IBAction func buttonPressed(sender: nextButtons) {
        
        
        showPage()
        sender.start();
        
    }
    
    
}
