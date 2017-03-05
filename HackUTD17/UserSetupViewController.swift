//
//  UserSetupViewController.swift
//  HackUTD17
//
//  Created by Amol on 3/4/17.
//  Copyright © 2017 Amol. All rights reserved.
//

import UIKit
import BuddySDK

class UserSetupViewController: UIViewController {
    
    
    @IBOutlet var genderSwitch: UISwitch!
    
    @IBOutlet var ageSlider: UISlider!
    
    @IBOutlet var ageLabel: UILabel!
    
    @IBOutlet var weightField: UITextField!
    
    
    @IBOutlet var allergyField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ageLabel.text = String(Int(5 + 115*(ageSlider.value))) + " years"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func updateUserInfo(_ sender: UIButton) {
        
        if(genderSwitch.isOn)
        {
            /*
            var params: [AnyHashable: Any] = ["userName": "SuperBuddy", "password": "p4ssw0rd", "gender": "Male", "dateOfBirth": "09/01/2016", "email": "support@buddy.com", "firstName": "First", "tag": "Some useful tag", "lastName": "Last", "profilePictureID": "bvc.bCkbbffnqbvq", "locationFuzz": (true)]
            Buddy.patch("User", parameters: params, class: Buddy.classForCoder(), callback: { (success, error) in
                if error != nil {
                    print(error)
                
                }
                else {
                    
                    
                }
            })
               */
                // Your callback code here
            var userMale = true;
            var userDefaults = UserDefaults.standard
            userDefaults.setValue(allergyField.text, forKey: "allergies")
           

        }
        
    }
    
    @IBAction func ageChanged(_ sender: UISlider) {
        
       ageLabel.text = String(Int(5 + 115*(ageSlider.value))) + " years"
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
