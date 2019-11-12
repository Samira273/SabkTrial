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

@available(iOS 13.0, *)
class SocialMediaSheetViewController: UIViewController {
  
    @IBOutlet private weak var signInWithTwitter: UIView!
    @IBOutlet private weak var stackView: UIStackView!
    var signInViewControllerReference: SignInViewController?
    @IBAction func signInWithGoogle(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signIn()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
      
        GIDSignIn.sharedInstance()?.presentingViewController = self
              // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        // Do any additional setup after loading the view.
        
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in

        if (session != nil) {
            self.signInViewControllerReference?.sheetController?.dismiss(animated: false)
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate  else {
               fatalError("errorrrrr")
               }
            appDelegate.navBetweenScreens = UINavigationController(rootViewController: appDelegate.newsScreenView)
            appDelegate.navBetweenScreens?.tabBarItem =
                      UITabBarItem(title: "news".localized, image: #imageLiteral(resourceName: "ic_newspaper_active"), tag: 1)
                  //Make : add other controllers with their navbars here
                  appDelegate.tabBarController.viewControllers =
                    [(appDelegate.navBetweenScreens ?? UINavigationController())]
                 appDelegate.window?.rootViewController = appDelegate.tabBarController
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
//
//       // stackView.addArrangedSubview(logInButton)
    }
}
