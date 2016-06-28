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
        let strURL:NSString = "https://itunes.apple.com/gb/rss/topfreeapplications/limit=100/json"
        
        // url
        let url = NSURL(string: strURL as String)
        
        // NSURLRequest
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        //
    }


}

