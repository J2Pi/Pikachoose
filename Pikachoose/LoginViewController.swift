//
//  LoginViewController.swift
//  Pikachoose
//
//  Created by Sahil Patel on 10/4/14.
//  Copyright (c) 2014 Pikachoose Inc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    var logInController: PFLogInViewController = PFLogInViewController()
    var signUpController: PFSignUpViewController = PFSignUpViewController()
    
    override func viewDidAppear(animated: Bool) {
        if (PFUser.currentUser() != nil) {
            let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
            var first = appDelegate.tabViewController!;
            self.presentViewController(first, animated: true, completion: nil)
        } else {
            self.logInController.delegate = self
            self.signUpController.delegate = self
            self.logInController.signUpController = signUpController
        }
    }
    
    override func viewDidLoad() {
        let hello: UILabel = UILabel(frame: CGRect(x:10, y:240, width:300, height:30))
        hello.text = "Welcome to Pikachoose"
        let color: UIColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        self.view.backgroundColor = color
        self.view.addSubview(hello)
        let button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.frame = CGRect(x:10, y:300, width:300, height:30)
        button.backgroundColor = UIColor.whiteColor()
        button.setTitle("Login", forState: UIControlState.Normal)
        button.addTarget(self, action: "openLogin:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    
    func openLogin(sender:UIButton!) {
        self.presentViewController(self.logInController, animated: true, completion: nil)
    }
    
    func logInViewController(logInController: PFLogInViewController!, shouldBeginLogInWithUsername username: String!, password: String!) -> Bool {
        if (username != nil && password != nil && username.utf16Count != 0 && password.utf16Count != 0) {
            return true
        }
        
        let alert: UIAlertView = UIAlertView(title: "Missing Information", message: "You must fill out all the fields!", delegate: nil, cancelButtonTitle: "Okay")
        alert.show()
        
        return false
    }
    
    func logInViewController(logInController: PFLogInViewController!, didLogInUser user: PFUser!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func signUpViewController(signUpController: PFSignUpViewController!, shouldBeginSignUp info: [NSObject : AnyObject]!) -> Bool {
        var informationComplete = true
        var info = info as NSDictionary
        
        // loop through all of the sign up information
        for (key,value) in info {
            var field = value as? NSString
            if (field == nil || field?.length == 0) {
                informationComplete = false
                break
            }
        }
        
        if (!informationComplete) {
            let alert: UIAlertView = UIAlertView(title: "Missing Information", message: "You must fill out all of the fields, dummy!", delegate: nil, cancelButtonTitle: "Okay")
            alert.show()
        }
        
        return informationComplete
    }
    
    func signUpViewController(signUpController: PFSignUpViewController!, didSignUpUser user: PFUser!) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        // change to app delegate tab controller
        var first: FirstViewController = FirstViewController()
        self.presentViewController(first, animated: true, completion: nil)
    }
}
