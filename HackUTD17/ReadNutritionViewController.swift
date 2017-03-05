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
        if productName.text == nil {
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
        if productName.text == nil {
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
            tesseract.image = UIImage(named: "NutritionLabel.JPG")?.g8_blackAndWhite()
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
            calorieList.append((strings?[1])!)
            let userDefaults = UserDefaults.standard
            userDefaults.set(calorieList, forKey: "calorieList")
            
            
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
