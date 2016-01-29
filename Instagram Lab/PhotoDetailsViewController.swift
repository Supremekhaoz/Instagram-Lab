//
//  PhotoDetailsViewController.swift
//  Instagram Lab
//
//  Created by Luis Liz on 1/28/16.
//  Copyright © 2016 Luis Liz. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

    @IBOutlet weak var photoView: UIImageView!
    
    var photo: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let photoUrl = photo?["images"]!["low_resolution"]!!["url"] as? String {
           let imageUrl = NSURL(string: photoUrl)
            photoView.setImageWithURL(imageUrl!)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
