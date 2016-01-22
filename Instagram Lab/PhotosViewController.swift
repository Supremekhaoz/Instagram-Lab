//
//  ViewController.swift
//  Instagram Lab
//
//  Created by Luis Liz on 1/21/16.
//  Copyright © 2016 Luis Liz. All rights reserved.
//

import UIKit
import AFNetworking

class PhotosViewController: UIViewController {
    
    var results:NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let clientId = "e05c462ebd86446ea48a5af73769b602"
        let url = NSURL(string:"https://api.instagram.com/v1/media/popular?client_id=\(clientId)")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                            NSLog("response: \(responseDictionary)")
                            self.results = (responseDictionary)as NSDictionary
                    }
                }
        });
        task.resume()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

