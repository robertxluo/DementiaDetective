//
//  FifthViewController.swift
//  ExamQuestions
//
//  Created by Kay Lab on 11/12/15.
//  Copyright © 2015 Team1. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    @IBOutlet var question4Label: UILabel!
    
    @IBOutlet var Answer4: UITextField!
    
    var PhotoAlbum = CustomPhotoAlbum()
    
    @IBAction func SubmitButton4(sender: UIButton) {
        let answer4 : String! = self.Answer4.text
        print(answer4)
    }
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func NextButton(sender: AnyObject) {
        PhotoAlbum.screenShotSaveToAlbum(self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextView : SixthViewController = segue.destinationViewController as! SixthViewController
        nextView.PhotoAlbum = self.PhotoAlbum
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
