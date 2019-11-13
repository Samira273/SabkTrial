//
//  AppDelegate.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/17/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit
import GoogleSignIn
import TwitterKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    let signInviewController = SignInViewController(nibName: "SignInViewController", bundle: nil)
    let newsScreenView = NewsScreenViewController(nibName: "NewsScreenViewController", bundle: nil)
    var window: UIWindow?
    let tabBarController = UITabBarController()
    var navBetweenScreens: UINavigationController?
    
    //sign in with google call back
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
       prepareHomeScreen()
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupApp()
        return true
    }
    
    func setupApp() {
        setupNetworking()
        setUpGoogleSignIn()
        setUpTwitterSignIn()
        prepareLogInScreen()
        registerForPushNotifications()
    }
    
    func registerForPushNotifications() {
     UNUserNotificationCenter.current()
        .requestAuthorization(options: [.alert, .sound, .badge]) { [weak self] granted, error in
            print("Permission granted: \(granted)")
            guard granted else { return }
            self?.getNotificationSettings()
        }
    }
    func getNotificationSettings() {
      UNUserNotificationCenter.current().getNotificationSettings { settings in
        print("Notification settings: \(settings)")
        guard settings.authorizationStatus == .authorized else { return }
        DispatchQueue.main.async {
          UIApplication.shared.registerForRemoteNotifications()
        }
      }
    }
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
        if(url.scheme == "com.googleusercontent.apps.732182052344-8bon8mu12od81muimmn9ebqb5hv5rghh") {
            return GIDSignIn.sharedInstance().handle(url)
        } else if(url.scheme == "twitterkit-yyab8n7v0xm1so9vao2cab4wf") {
        return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
        }
        return false
    }
    //prepare home to be presented on window
    func prepareHomeScreen() {
        navBetweenScreens = UINavigationController(rootViewController: newsScreenView)
        navBetweenScreens?.tabBarItem =
            UITabBarItem(title: "news".localized, image: #imageLiteral(resourceName: "ic_newspaper_active"), tag: 1)
        //Make : add other controllers with their navbars here
        tabBarController.viewControllers = [(navBetweenScreens ?? UINavigationController())]
        window?.rootViewController = tabBarController
    }

    func setUpGoogleSignIn() {
        GIDSignIn.sharedInstance().clientID = "732182052344-8bon8mu12od81muimmn9ebqb5hv5rghh.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
    }
    
    func setUpTwitterSignIn() {
        TWTRTwitter.sharedInstance().start(withConsumerKey: "yyAb8n7V0xM1sO9vAO2cAb4wf",
                                           consumerSecret: "eQLkaKxshQP2bZnX1kZsQMZZDrgH8EmMlYlQFuwijU1PdmX0MZ")
    }
    
    func prepareLogInScreen() {
        window = UIWindow(frame: UIScreen.main.bounds)
        navBetweenScreens = UINavigationController(rootViewController: signInviewController)
        window?.rootViewController = navBetweenScreens
        window?.makeKeyAndVisible()
    }
    
    func application(
      _ application: UIApplication,
      didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
      let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
      let token = tokenParts.joined()
      print("Device Token: \(token)")
    }

    func application(
      _ application: UIApplication,
      didFailToRegisterForRemoteNotificationsWithError error: Error) {
      print("Failed to register: \(error)")
    }
    
}
