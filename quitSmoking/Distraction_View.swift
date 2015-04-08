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
        
        getPages()
        
        
        
        
        
        
        
        
        
        
    }
    
    func getPages(){
        
        //GET URL FROM GOALS, DEPENDING ON INTEREST(RANDOM)
        
        if(Goals.checkInterest("World News") == true){
            let urlPath: String = "http://rss.cbc.ca/lineup/world.xml"
            /* for the cbc feed, try http://rss.cbc.ca/lineup/topstories.xml */
        
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
            var url: NSURL = NSURL(string: urlPath)!
            var request: NSURLRequest = NSURLRequest(URL: url)
            var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: true)!
        
            connection.start()
        }
        if(Goals.checkInterest("NHL") == true){
            let urlPath: String = "http://www.nhl.com/rss/news.xml"
           
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            
            
            
            var new_p = New_Parsers(urlPath: "\(urlPath)")
            
            
            connection.start()
        }
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //FROM ASSIGNMENT~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.dataStore.appendData(data)
    }
    
    func connection(connection: NSURLConnection!, didFailWithError error: NSError!) {
        NSLog("Connection failed.\(error.localizedDescription)")
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!)
    {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        var results = NSString(data: dataStore, encoding: NSUTF8StringEncoding)
        
        
        
        println("the results from the feed is:")
        println("************************************")
        println()
        println(results)
        println("************************************")
        
        // start the parser
        parser = NSXMLParser(data: dataStore)
        parser.delegate = self      // don't forget to set the delegate for the parser
        parser.parse()
        
    } // connectionDidFinishLoading
    
    
    func parser(parser: NSXMLParser!,didStartElement elementName: String!, namespaceURI: String!, qualifiedName : String!, attributes attributeDict: NSDictionary!) {
        
        if elementName == "guid" {
            processingItem = true
        }
    } // didStartElement
    
    func parser(parser: NSXMLParser!, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!) {
        
        
        
        if elementName == "guid"{
            itemsArray.append(currentElement)
            println("************************************")
            println("Got item \(itemsArray.count):")
            println(" ")
            println(currentElement)
            let theScanner = NSScanner(string: currentElement)
            
            var descrip: NSString?
            var title: NSString?
            var image: NSString?
            
            var url: NSString?
            var ds: String
            
            
            //var quoteSet = NSCharacterSet(charactersInString: "\n")
            //theScanner.scanUpToCharactersFromSet(quoteSet, intoString: &title)
            

            
            ds = "http://"
            theScanner.scanUpToString(ds, intoString: nil)
            //ds = theScanner
            theScanner.scanUpToString("", intoString: &url)

            
            println("HERE")
            println("\(url!)")
            Goals.addLink(url!)
            
            
            
            
            
            //println("\(title)")
            
            currentElement = ""
            processingItem = false
        }
        
    } //didEndElement
    
    
    
    
    
    func parserDidEndDocument(parser: NSXMLParser!) {
        showPage();
        self.webView.reload()
    }
    
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!) {
        if (processingItem!){ // we know this bool variable is never nil!
            currentElement += string
        }
    } // foundCharacters
    
    func parser(parser: NSXMLParser!, parseErrorOccurred parseError: NSError!) {
        NSLog("failure error: %@", parseError)
    }

    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    func showPage(){

            var url = Goals.getLink()
        
            let requestURL = NSURL(string:url)
            let request = NSURLRequest(URL: requestURL!)
            webView.scalesPageToFit = true
            webView.loadRequest(request)
        
        
        
    }
    
    
    
    
}
