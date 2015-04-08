//
//  New_Parsers.swift
//  quitSmoking
//
//  Created by Travis Kellar on 2015-04-08.
//  Copyright (c) 2015 Goran Pavlovic/Travis Kellar. All rights reserved.
//

import UIKit
import Foundation

class New_Parsers: NSObject, NSXMLParserDelegate{

    var dataStore = NSMutableData()    // to store the complete rss feed
    var parser = NSXMLParser()
    var currentElement = ""         // contains the element currently parsed by NSXMLParser
    var processingItem :Bool = false     // delete the "?", understand why there would be an error, set to true if the parser is processing the element "item"
    var itemsArray: [String] = []   // to store the parsed items from the feed
    var site_path: String = ""

    
    func start(urlPath: String){
        site_path = urlPath
        var url: NSURL = NSURL(string: urlPath)!
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection;
        //super.init()
        connection = NSURLConnection(request: request, delegate: self,startImmediately: true)!
        connection.start()
    }

    
    
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
        
        if (site_path == "http://www.nhl.com/rss/news.xml" || site_path == "http://america.aljazeera.com/content/ajam/articles.rss") && elementName == "guid" {
            processingItem = true
        }
        else if site_path == "http://rss.cbc.ca/lineup/world.xml" && elementName == "item" {
            processingItem = true
        }
    } // didStartElement
    
    func parser(parser: NSXMLParser!, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!) {
        
        
        if(site_path == "http://www.nhl.com/rss/news.xml"){
        if elementName == "guid"{
            itemsArray.append(currentElement)
            //println("************************************")
            //println("Got item \(itemsArray.count):")
            //println(" ")
            //println(currentElement)
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
            
            
            //println("HERE")
            //println("\(url!)")
            Goals.addLink(url!)
            
            
            
            
            
            //println("\(title)")
            
            currentElement = ""
            processingItem = false
        }
        }
        else if(site_path == "http://rss.cbc.ca/lineup/politics.xml"){
            if elementName == "item"{
                itemsArray.append(currentElement)
                //println("************************************")
                //println("Got item \(itemsArray.count):")
                //println(" ")
                //println(currentElement)
                let theScanner = NSScanner(string: currentElement)
                
                var descrip: NSString?
                var title: NSString?
                var image: NSString?
                
                var url: NSString?
                var ds: String
                
                
                //var quoteSet = NSCharacterSet(charactersInString: "\n")
                //theScanner.scanUpToCharactersFromSet(quoteSet, intoString: &title)
                
                
                
                var quoteSet = NSCharacterSet(charactersInString: "\n")
                theScanner.scanUpToCharactersFromSet(quoteSet, intoString: &title)
                
                ds = "=rss"
                theScanner.scanUpToString(ds, intoString: &url)
                
                url = "\(url!)=rss"

                Goals.addLink(url!)
                
                
                
                
                
                //println("\(title)")
                
                currentElement = ""
                processingItem = false
            }

            
            
            
        }
        
        if(site_path == "http://america.aljazeera.com/content/ajam/articles.rss"){
            if elementName == "guid"{
                itemsArray.append(currentElement)
                //println("************************************")
                //println("Got item \(itemsArray.count):")
                //println(" ")
                //println(currentElement)
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
        }
        
    } //didEndElement
    
    
    
    
    
    func parserDidEndDocument(parser: NSXMLParser!) {
        //showPage();
        //self.webView.reload()
    }
    
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!) {
        if (processingItem){ // we know this bool variable is never nil!
            currentElement += string
        }
    } // foundCharacters
    
    func parser(parser: NSXMLParser!, parseErrorOccurred parseError: NSError!) {
        NSLog("failure error: %@", parseError)
    }

    
    
    
    
}
