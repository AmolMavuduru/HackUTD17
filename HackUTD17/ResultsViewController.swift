//
//  ResultsViewController.swift
//  HackUTD17
//
//  Created by Amol on 3/4/17.
//  Copyright © 2017 Amol. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var caloriesLabel: UILabel!
    @IBOutlet var fatsLabel: UILabel!
    
    @IBOutlet var carbsLabel: UILabel!
    
    @IBOutlet var proteinLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var calories = UserDefaults.standard.value(forKey: "lastCalorieCheck")
        caloriesLabel.text = "Calories: \(calories)"
        
        // Do any additional setup after loading the view.
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
