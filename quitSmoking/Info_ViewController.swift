//
//  Info_ViewController.swift
//  quitSmoking
//
//  Created by Goran Pavlovic on 2015-04-07.
//  Copyright (c) 2015 Goran Pavlovic/Travis Kellar. All rights reserved.
//

import UIKit

class Info_ViewController: UIViewController {
    
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlPath: String = "http://healthycanadians.gc.ca/healthy-living-vie-saine/tobacco-tabac/quit_now-cesser_maintenant-eng.php"
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        let requestURL = NSURL(string:urlPath)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
