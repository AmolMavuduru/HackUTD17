//
//  ResultsViewController.swift
//  HackUTD17
//
//  Created by Amol on 3/4/17.
//  Copyright © 2017 Amol. All rights reserved.
//

import UIKit
import BuddySDK
import TesseractOCR

class ResultsViewController: UIViewController {

    @IBOutlet var caloriesLabel: UILabel!
    @IBOutlet var fatsLabel: UILabel!
    
    @IBOutlet var carbsLabel: UILabel!
    
    @IBOutlet var proteinLabel: UILabel!
    
    
    
    @IBOutlet var allergyAlertsLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var calories = UserDefaults.standard.value(forKey: "lastCalorieCheck") as! String
        caloriesLabel.text = "Calories: \(calories)"
        
        var fats = UserDefaults.standard.value(forKey: "lastFatCheck") as! String + " g"
        fatsLabel.text = "Fats: \(fats)"
        
        var carbs = UserDefaults.standard.value(forKey: "lastCarbsCheck") as! String + " g"
        carbsLabel.text = "Carbohydrates: \(carbs)"
        
        var protein = UserDefaults.standard.value(forKey: "lastProteinCheck") as! String
        proteinLabel.text = "Protein: \(protein)" + " g"
        
        if(UserDefaults.standard.value(forKey: "allergiesFound") != nil)
        {
            allergyAlertsLabel.text = UserDefaults.standard.value(forKey: "allergiesFound") as! String!
        }
        else
        {
            allergyAlertsLabel.text = "No allergens found"
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logOut(_ sender: Any) {
        
        Buddy.currentClient().logoutUser { (success) in
            
        }
        
        self.performSegue(withIdentifier: "goBackToLogin", sender: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
