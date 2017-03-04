//
//  ViewController.swift
//  HackUTD17
//
//  Created by Amol on 3/4/17.
//  Copyright © 2017 Amol. All rights reserved.
//

import UIKit
import BuddySDK
import TesseractOCR

class ViewController: UIViewController {
    
    
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var loginOrSignUpButton: UIButton!
   
    
    @IBOutlet var changeModeButton: UIButton!
    
    @IBOutlet var suggestionLabel: UILabel!
    
    var loginMode: Bool = true;
    var signUpMode: Bool = false;
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func changeSignUpMode(_ sender: UIButton) {
            
            if(loginMode)
            {
                loginMode = false
                signUpMode = true
                suggestionLabel.text = "Already have an account?"
                changeModeButton.setTitle("Login", for: [])
                loginOrSignUpButton.setTitle("Sign up", for: [])
            }
            else
            {
                signUpMode = false
                loginMode = true
                suggestionLabel.text = "Don't have an account?"
                changeModeButton.setTitle("Sign Up", for: [])
                loginOrSignUpButton.setTitle("Login", for: [])
                
            }
        
    }
    
    
    @IBAction func loginOrSignUp(_ sender: UIButton) {
            
            if loginMode
            {
                Buddy.loginUser(usernameField.text, password: passwordField.text, callback: { (Success, error) in
                    if(error != nil)
                    {
                        print(error)
                    }
                    else
                    {
                        print("User logged in!")
                    }
                })
            }
            else
            {
                Buddy.createUser(usernameField.text, password: passwordField.text, firstName: nil, lastName: nil, email: nil, dateOfBirth: nil, gender: nil, tag: nil, callback: { (success, error) in
                    
                    if(error != nil)
                    {
                        print(error)
                    }
                    else
                    {
                        print("User signed up!")
                    }
                })
                
                self.performSegue(withIdentifier: "goToUserSetup", sender: self)
            }
            
            
        
    }
    
    

}

