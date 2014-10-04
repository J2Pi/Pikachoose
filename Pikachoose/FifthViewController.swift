//
//  FifthViewController.swift
//  Pikachoose
//
//  Created by Jonathan Tau on 10/4/14.
//  Copyright (c) 2014 Pikachoose Inc. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.frame = CGRect(x:100, y:100, width:300, height:100)
        button.backgroundColor = UIColor.whiteColor()
        button.setTitle("Logout", forState: UIControlState.Normal)
        button.addTarget(self, action: "logoutAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    
    func logoutAction(sender:UIButton!) {
        PFUser.logOut()
        var login: LoginViewController = LoginViewController()
        self.presentViewController(login, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


