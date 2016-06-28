//
//  ViewController.swift
//  JSONParse
//
//  Created by wealthyjalloh on 28/06/2016.
//  Copyright © 2016 CWJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlet
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var myDescription: UITextView!
    
    var dataJSON = NSMutableData()

    override func viewDidLoad() {
        super.viewDidLoad()
        let strURL:NSString = "https://itunes.apple.com/gb/rss/topfreeapplications/limit=10/json"
        
        // url
        let url = NSURL(string: strURL as String)
        
        // NSURLRequest
        let request = NSURLRequest(URL: url!)
        
        // connection
        let connection: NSURLConnection? = NSURLConnection(request: request, delegate: self)
        
        if(connection != nil) {
            print("connecting...")
            dataJSON = NSMutableData()
        }
        else {
            print("connection failed")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func connection(connection: NSURLConnection!, didFailWithError error:NSError!) {
        print("Error: \(error)")
    }
    
    func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        print("Received response: \(response)")
        // restore data 
        dataJSON.length = 0
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data:NSData!) {
        self.dataJSON.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        do {
            let dict:NSDictionary! = try NSJSONSerialization.JSONObjectWithData(dataJSON, options: .MutableContainers) as? NSDictionary
            
            // get from JSON
            let upper: AnyObject = ((dict["feed"] as! NSDictionary) ["entry"]! as! NSArray) [0]
            let imgJSON: AnyObject = (upper["im:image"] as! NSArray) [2]
            let url = NSURL(string: imgJSON.objectForKey("label") as! String)
            let data = NSData(contentsOfURL: url!)
            let img = UIImage(data: data!)
            imageView.image = img
            
            
            // get title and description
            let titlee = (upper["title"] as! NSDictionary) ["label"] as! NSString
            let desc = (upper["summary"] as! NSDictionary) ["label"] as! NSString
            titleLabel.text = titlee as String
            myDescription.text = desc as String
            
            
        } catch {
            // failure
            print("Fetch failed")
        }
    }
    


}

