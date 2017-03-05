//
//  StatsViewController.swift
//  HackUTD17
//
//  Created by Amol on 3/5/17.
//  Copyright © 2017 Amol. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    
    @IBOutlet var totalCals: UILabel!
    
    @IBOutlet var totalFats: UILabel!
    
    @IBOutlet var totalCarbs: UILabel!
    
    @IBOutlet var totalProtein: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var sumCals = 0
        var sumFats = 0
        var sumCarbs = 0
        var sumProtein = 0
        


        
        if let cals: [String] = UserDefaults.standard.object(forKey: "calorieList") as! [String]?
        {
            
            for c in cals
            {
                if let myNumCals = NumberFormatter().number(from: c)
                {
                  var cNum = myNumCals.intValue
                  sumCals += cNum
                }
            }
            
            print(sumCals)
        }
       
        if let fats: [String] = UserDefaults.standard.object(forKey: "fatList") as! [String]?
        {
            
            for f in fats
            {
                if let myNumFats = NumberFormatter().number(from: f)
                {
                    var fNum = myNumFats.intValue
                    sumFats += fNum
                }
            }
            
        }
        
        if let carbs: [String] = UserDefaults.standard.object(forKey: "carbsList") as! [String]?
        {
            for c in carbs
            {
                if let myNumCarbs = NumberFormatter().number(from: c)
                {
                    var cNum = myNumCarbs.intValue
                    sumCarbs += cNum
                }
            }
            
            print(sumCarbs)

        }
        

        if let protein: [String] = UserDefaults.standard.object(forKey: "proteinList") as! [String]?
        {
            
            for p in protein
            {
                if let myNumProtein = NumberFormatter().number(from: p)
                {
                    var pNum = myNumProtein.intValue
                    sumProtein += pNum
                }
            }
            
            print(sumProtein)
            
            
        }
        
        totalCals.text = "Total Calories: \(sumCals)"
        totalFats.text = "Total Fats: \(sumFats)"
        totalCarbs.text = "Total Carbs: \(sumCarbs)"
        totalProtein.text = "Total Protein \(sumProtein)"

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
