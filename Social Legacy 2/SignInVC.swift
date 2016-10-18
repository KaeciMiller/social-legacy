//
//  ViewController.swift
//  Social Legacy 2
//
//  Created by Kaeci Mill on 10/17/16.
//  Copyright © 2016 Clout, Inc. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailField: FancyField!
    @IBOutlet weak var passwordField: FancyField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("KEVIN: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("KEVIN: User cancelled Facebook Authentication")
            } else {
                print("KEVIN: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
        
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("KEVIN: Unable to authenticate with Firebase - \(error)")
            } else {
                print("KEVIN: Successfully authenticated with Firebase")
            }
        })

}
    
    @IBAction func signInBtnTapped(_ sender: AnyObject) {
        
        if let email = emailField.text, let pwd = passwordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("KEVIN: Email user authenticated with Firebase")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("KEVIN: Unable to authenticate with Firebase using email")
                        } else {
                            print("KEVIN: Successfully authenticated with Firebase")
                        }
                    })
                }
            })
        }
        
    }
    

}
