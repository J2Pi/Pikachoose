//
//  LoginViewController.swift
//  Pikachoose
//
//  Created by Sahil Patel on 10/4/14.
//  Copyright (c) 2014 Pikachoose Inc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    override func viewDidAppear(animated: Bool) {
        var logInController: PFLogInViewController = PFLogInViewController()
        logInController.delegate = self
        self.presentViewController(logInController, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        //let hello: UILabel = UILabel(frame: CGRect(x:10, y:240, width:300, height:30))
        //hello.text = "Hello World!"
        let color: UIColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        self.view.backgroundColor = color
        //self.view.addSubview(hello)
    }
}
