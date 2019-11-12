//
//  SocialMediaPopUPViewController.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 11/11/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit
import GoogleSignIn

class SocialMediaSheetViewController: UIViewController {
  
    @IBAction func signInWithGoogle(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
        GIDSignIn.sharedInstance()?.presentingViewController = self
              // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        // Do any additional setup after loading the view.
    }
}
