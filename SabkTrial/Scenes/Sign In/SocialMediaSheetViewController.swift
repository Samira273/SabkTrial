//
//  SocialMediaPopUPViewController.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 11/11/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit
import GoogleSignIn
import TwitterKit

class SocialMediaSheetViewController: UIViewController {
  
    @IBOutlet private weak var signInByGoogleBtnImg: UIButton!
    @IBOutlet private weak var signInWithTwitter: UIView!
    @IBOutlet private weak var signInByGoogleBtnText: UIButton!
    @IBOutlet private weak var stackView: UIStackView!
    var signInViewController: SignInViewController?
    @IBAction func signInWithGoogle(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signIn()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        signInByGoogleBtnText.layer.borderColor = UIColor(named: "borderColor")?.cgColor
        signInByGoogleBtnText.layer.borderWidth = 1
        signInByGoogleBtnText.layer.cornerRadius = 2
        signInByGoogleBtnImg.layer.borderColor = UIColor(named: "borderColor")?.cgColor
        signInByGoogleBtnImg.layer.borderWidth = 1
        signInByGoogleBtnImg.layer.cornerRadius = 2
        GIDSignIn.sharedInstance()?.presentingViewController = self
            // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        // Do any additional setup after loading the view.
        let logInButton = TWTRLogInButton(logInCompletion: { session, _ in
        if (session != nil) {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            appDelegate.prepareHomeScreen()
                    } else {
        print("error: (String(describing: error?.localizedDescription))");
                    }
                })
        signInWithTwitter.addSubview(logInButton)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
              logInButton.leftAnchor.constraint(equalTo: signInWithTwitter.leftAnchor).isActive = true
              logInButton.topAnchor.constraint(equalTo: signInWithTwitter.topAnchor).isActive = true
              logInButton.rightAnchor.constraint(equalTo: signInWithTwitter.rightAnchor).isActive = true
              logInButton.bottomAnchor.constraint(equalTo: signInWithTwitter.bottomAnchor).isActive = true
    }
}
