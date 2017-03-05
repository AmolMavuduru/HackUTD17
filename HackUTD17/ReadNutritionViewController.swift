//
//  ReadNutritionViewController.swift
//  HackUTD17
//
//  Created by Amol on 3/4/17.
//  Copyright © 2017 Amol. All rights reserved.
//

import UIKit
import BuddySDK
import TesseractOCR


class ReadNutritionViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, G8TesseractDelegate {
    
    var infoStrings: [String] = []
    var calorieList: [String] = []
    var fatList: [String] = []
    var carbsList: [String] = []
    var proteinList: [String] = []
    
    
    
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var productName: UITextField!
    
    
    
    
    
    @IBAction func addImage(_ sender: UIButton) {
        if productName.text == "" {
            errorLabel.isHidden = false
            
        } else {

        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePicker.allowsEditing = false
        
        self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let imageObtained = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            image.image = imageObtained
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }

    @IBAction func accessCamera(_ sender: Any) {
        if productName.text == "" {
            errorLabel.isHidden = false
            
        } else {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
            
         }
    }
    @IBAction func convertToText(_ sender: UIButton) {
        
        if let tesseract = G8Tesseract(language: "eng")
        {

            tesseract.delegate = self
            tesseract.image = UIImage(named: "IMG_1700.JPG")?.g8_blackAndWhite()
            //tesseract.image = UIImage(named: "NutritionLabel.jpg")?.g8_grayScale()
            
            var grayScaleImage = tesseract.image.g8_blackAndWhite()
            image.image = grayScaleImage
           /* tesseract.charWhitelist = "qwetyuiopasdfhjklzxcvbnmQWERTYUIPASDFHJKXCVBNMZ1234567890%"*/
//            tesseract.charWhitelist = " QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890.\n%"
            
            tesseract.recognize()
            progressImageRecognition(for: tesseract)
            print(tesseract.recognizedText)
            
            infoStrings.append(tesseract.recognizedText)
       
            let infoString = tesseract.recognizedText
            var strings = infoString?.components(separatedBy: "Calories")
            print(strings)
            calorieList.append((strings?[1])! as! String)
            let userDefaults = UserDefaults.standard.set(calorieList, forKey: "calorieList")
            
            UserDefaults.standard.set((strings?[1])!, forKey: "lastCalorieCheck")
            UserDefaults.standard.setValue(calorieList, forKey: "calorieList")
            
            strings = infoString?.components(separatedBy: "Total Fat")
            
            if let splitStrings: [String] = strings![1].components(separatedBy: "g")
            {
            
                var fatString = splitStrings[0] as! String
                UserDefaults.standard.setValue(fatString, forKey: "lastFatCheck")
                
                fatList.append((splitStrings[1]))
                let userDefaults = UserDefaults.standard.set(fatList, forKey: "fatList")
                
            
            }
            
            
            strings = infoString?.components(separatedBy: "Total Carbohydrate")
            
            if let stringSplit = strings?[1].components(separatedBy: "g")
            {
            
            var carbsString = stringSplit[0] as! String
            UserDefaults.standard.setValue(carbsString, forKey: "lastCarbsCheck")
                carbsList.append(carbsString)
                UserDefaults.standard.setValue(carbsList, forKey: "carbsList")
            }
            
            strings = infoString?.components(separatedBy: "Protein")
            
            if let stringSplit2 = strings?[1].components(separatedBy: "Vitamin A")
            {
                var proteinString = stringSplit2[0] as! String
                UserDefaults.standard.setValue(proteinString, forKey: "lastProteinCheck")
                proteinList.append(proteinString)
                UserDefaults.standard.setValue(proteinList, forKey: "proteinList")
                
            }
        
            var allergies: String = UserDefaults.standard.value(forKey: "allergies") as! String
            
            if(infoStrings.contains(allergies))
            {
                UserDefaults.standard.set(allergies, forKey: "allergiesFound")
            }
            else
            {
                UserDefaults.standard.set("", forKey: "allergiesFound")
            }
            
            self.performSegue(withIdentifier: "goToNutritionData", sender: self)
            
            
        }
        
        
    }
    
    func progressImageRecognition(for tesseract: G8Tesseract!) {
        print("Recognition Progress \(tesseract.progress) %")
    }

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
errorLabel.isHidden = true
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
