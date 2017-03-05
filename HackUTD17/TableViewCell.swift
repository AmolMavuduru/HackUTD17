//
//  TableViewCell.swift
//  HackUTD17
//
//  Created by Amol on 3/4/17.
//  Copyright © 2017 Amol. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var itemNameLabel: UILabel!
    
    @IBOutlet var caloriesLabel: UILabel!
    
    @IBOutlet var carbsLabel: UILabel!
    
    @IBOutlet var proteinLabel: UILabel!
    
    @IBOutlet var fatsLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        var caloriesList: [String] = UserDefaults.standard.value(forKey: "caloriesList") as! [String]
        caloriesLabel.text = caloriesList[1];
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
