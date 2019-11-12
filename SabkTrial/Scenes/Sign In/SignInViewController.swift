//
//  SignInViewController.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 11/7/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit
import FittedSheets
import AuthenticationServices

@available(iOS 13.0, *)
class SignInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet private weak var signInWithAppleBtn: UIButton!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var signInButton: UIButton!
    @IBOutlet private weak var forgetPAsswordBtn: UIButton!
    var sheetController: SheetViewController?
    var socialMediaPopUPViewController: SocialMediaSheetViewController?
    
    @IBAction func signInBySocialMedia(_ sender: Any) {
        // init YourViewController
       socialMediaPopUPViewController =
            SocialMediaSheetViewController(nibName: "SocialMediaPopUPViewController", bundle: nil)
        sheetController =
            SheetViewController(controller: socialMediaPopUPViewController ?? SocialMediaSheetViewController(),
                                sizes: [.fixed(212), .fixed(200), .fixed(212), .fixed(200)])

        // Adjust how the bottom safe area is handled on iPhone X screens
        sheetController?.blurBottomSafeArea = false
        sheetController?.adjustForBottomSafeArea = true
        // Turn off rounded corners
        sheetController?.topCornersRadius = 0
      
        // Make corners more round
        sheetController?.topCornersRadius = 7
       
        // Disable the dismiss on background tap functionality
        sheetController?.dismissOnBackgroundTap = true
        // Extend the background behind the pull bar instead of having it transparent
        sheetController?.extendBackgroundBehindHandle = true
        
        self.present(sheetController ?? SheetViewController(), animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        setupAppleSignin()
        prepareTextFields()
        prepareNavigationBar()
        makeShadowForButton()
    }
    
    func prepareTextFields() {
        passwordTextField.becomeFirstResponder()
        userNameTextField.becomeFirstResponder()
        self.userNameTextField.delegate = self
        self.passwordTextField.delegate = self
   
    }
    
    func makeShadowForButton() {
        //make shadow for button
        signInButton.layer.shadowColor = UIColor.black.cgColor
        signInButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        signInButton.layer.shadowRadius = 8
        signInButton.layer.shadowOpacity = 0.5
        signInButton.layer.masksToBounds = false
    }
    
    func prepareNavigationBar() {
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
        self.navigationController?.navigationBar.titleTextAttributes =
            textAttributes as [NSAttributedString.Key: Any]
        self.navigationItem.title = "الملف الشخصي"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        passwordTextField.resignFirstResponder()
        userNameTextField.resignFirstResponder()

   }
  
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField.tag == 3) {
            prepareNotificationCenter()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField.tag == 3) {
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    }
    
    func prepareNotificationCenter() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc
    func keyboardWillShow(sender: NSNotification) {
        if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height * 0.5
            }
        }
    }
    
    @objc
    func keyboardWillHide(sender: NSNotification) {
        if view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func setupAppleSignin() {
        signInWithAppleBtn.contentHorizontalAlignment = .fill
        signInWithAppleBtn.contentVerticalAlignment = .fill
        signInWithAppleBtn.addTarget(self, action: #selector(actionHandleAppleSignin), for: .touchUpInside)
    }
    
    @available(iOS 13.0, *)
    @objc
    func actionHandleAppleSignin() {
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.presentationContextProvider = self
            authorizationController.performRequests()
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
