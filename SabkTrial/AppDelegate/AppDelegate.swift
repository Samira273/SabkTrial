//
//  AppDelegate.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/17/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit
import GoogleSignIn

@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    let signInviewController = SignInViewController(nibName: "SignInViewController", bundle: nil)
    let newsScreenView = NewsScreenViewController(nibName: "NewsScreenViewController", bundle: nil)
    var window: UIWindow?
    let tabBarController = UITabBarController()
    var navBetweenScreens: UINavigationController?
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
         if let error = error {
           if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
             print("The user has not signed in before or they have since signed out.")
           } else {
             print("\(error.localizedDescription)")
           }
           return
         }
         
       navBetweenScreens = UINavigationController(rootViewController: newsScreenView)
        navBetweenScreens?.tabBarItem =
            UITabBarItem(title: "news".localized, image: #imageLiteral(resourceName: "ic_newspaper_active"), tag: 1)
                //Make : add other controllers with their navbars here
        tabBarController.viewControllers = [(navBetweenScreens ?? UINavigationController())]
        window?.rootViewController = tabBarController
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupApp()
        return true
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
      return GIDSignIn.sharedInstance().handle(url)
    }
    
    func setupApp() {
        setupNetworking()
        GIDSignIn.sharedInstance().clientID = "732182052344-8bon8mu12od81muimmn9ebqb5hv5rghh.apps.googleusercontent.com"
               GIDSignIn.sharedInstance().delegate = self
        window = UIWindow(frame: UIScreen.main.bounds)
         navBetweenScreens = UINavigationController(rootViewController: signInviewController)
        window?.rootViewController = navBetweenScreens
        window?.makeKeyAndVisible()
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
}

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
