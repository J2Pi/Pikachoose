//
//  addAlbumViewController.swift
//  Pikachoose
//
//  Created by Jonathan Tau on 10/4/14.
//  Copyright (c) 2014 Pikachoose Inc. All rights reserved.
//

import UIKit

class addAlbumViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*var testObject = PFObject(className:"TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackground()*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}