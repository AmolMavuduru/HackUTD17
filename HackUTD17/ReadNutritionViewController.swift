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
    
    
    @IBOutlet var image: UIImageView!
    
    
    @IBOutlet var imageText: UITextView!
    
    
    @IBAction func addImage(_ sender: UIButton) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePicker.allowsEditing = false
        
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let imageObtained = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            image.image = imageObtained
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }

    
    @IBAction func convertToText(_ sender: UIButton) {
        
        if let tesseract = G8Tesseract(language: "eng")
        {

            tesseract.delegate = self
            tesseract.image = UIImage(named: "Ingredients.jpg")?.g8_blackAndWhite()
            //tesseract.image = UIImage(named: "NutritionLabel.jpg")?.g8_grayScale()
            
            var grayScaleImage = tesseract.image.g8_blackAndWhite()
            image.image = grayScaleImage
            
            
            tesseract.recognize()
            
            imageText.text = tesseract.recognizedText
        }
        
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
