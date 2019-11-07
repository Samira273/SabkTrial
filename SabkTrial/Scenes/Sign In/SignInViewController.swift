//
//  SignInViewController.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 11/7/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit
import GoogleSignIn
import SafariServices

class SignInViewController: UIViewController {
    
    @IBOutlet private weak var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        // Do any additional setup after loading the view.
        let leftButton = UIButton(type: .custom)
        leftButton.setImage(#imageLiteral(resourceName: "ic_back"), for: .normal)
        leftButton.frame = CGRect(x: 0.0, y: 0.0, width: 19.0, height: 14.0)
        //button.addTarget(target, action: nil, for: .touchUpInside)
        let leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        let rightButton = UIButton(type: .custom)
        rightButton.setImage(#imageLiteral(resourceName: "ic_setting"), for: .normal)
        rightButton.frame = CGRect(x: 0.0, y: 0.0, width: 21.0, height: 21.0)
        //button.addTarget(target, action: nil, for: .touchUpInside)
        let rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#5e5e5e")]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key: Any]
        self.navigationItem.title = "الملف الشخصي"
        //make shadow
        signInButton.layer.shadowColor = UIColor.black.cgColor
        signInButton.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        signInButton.layer.shadowRadius = 8
        signInButton.layer.shadowOpacity = 0.5
        signInButton.layer.masksToBounds = false
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
