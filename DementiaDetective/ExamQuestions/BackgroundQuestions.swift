//
//  BackgroundQuestions.swift
//  Dementia-Detective
//
//  Created by Robert Luo on 11/12/15.
//  Copyright © 2015 Team 1. All rights reserved.
//

import UIKit

class BackgroundQuestions: ViewController{

    // UIPickerViewDelegate, UITextFieldDelegate
    
    //@IBOutlet weak var educationPicker: UIPickerView!
    //@IBOutlet weak var educationText: UITextField!
    @IBOutlet weak var dateOfBirthPicker: UIDatePicker!
    @IBOutlet weak var dateOfBirthText: UITextField!
    var PhotoAlbum = CustomPhotoAlbum()

   /* var highestEducationArray = ["Less than High School", "High School / GED", "Some College", "2-year College Degree", "4-year College Degree", "Masters Degree", "Doctoral or Professional Degree", "None of the Above"]
    
    var ethnicityArray = []
    
*/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

    // HIGHEST EDUCATION LEVEL
 /*
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1 // it's for components that show's showing in pickerview
    }
    

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return highestEducationArray.count // it's for showing number of rows in per components
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return highestEducationArray[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        educationText.text = highestEducationArray[row]
    }
    
    @IBAction func educationTextBeginEdit(sender: UITextField) {
        educationPicker.hidden = false
    }
*/

    //DATE OF BIRTH
    
//    @IBAction func NextButton(sender: AnyObject) {
//        PhotoAlbum.screenShotSaveToAlbum(self)
//    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextView : BackgroundQuestions2ViewController = segue.destinationViewController as! BackgroundQuestions2ViewController
        nextView.PhotoAlbum = self.PhotoAlbum
    }
    
    @IBAction func dateOfBirthTextFieldEditing(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.Date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    @IBAction func NextButton(sender: AnyObject) {
        self.PhotoAlbum.screenShotSaveToAlbum(self)
    }

    func datePickerValueChanged(sender:UIDatePicker) {
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMMM dd, YYYY"
        dateOfBirthText.text = formatter.stringFromDate(sender.date)
    }



    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
