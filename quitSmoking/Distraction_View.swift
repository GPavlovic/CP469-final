//
//  Distraction_View.swift
//  quitSmoking
//
//  Created by Travis Kellar on 2015-04-08.
//  Copyright (c) 2015 Goran Pavlovic/Travis Kellar. All rights reserved.
//

import UIKit
import Foundation

class Distraction_View: UIViewController{

    
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        
        
        
        
        super.viewDidLoad()
        
        let urlPath: String = "http://healthycanadians.gc.ca/healthy-living-vie-saine/tobacco-tabac/quit_now-cesser_maintenant-eng.php"
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        let requestURL = NSURL(string:urlPath)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
