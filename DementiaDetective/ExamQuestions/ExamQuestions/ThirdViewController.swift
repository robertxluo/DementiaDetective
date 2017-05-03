//
//  ThirdViewController.swift
//  ExamQuestions
//
//  Created by Kay Lab on 11/12/15.
//  Copyright © 2015 Team1. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet var question2Label: UILabel!
    
    @IBOutlet var img1: UIImageView!
    @IBOutlet var Answer2a: UITextField!
    
    @IBOutlet var img2: UIImageView!
    @IBOutlet var Answer2b: UITextField!
    
    var answer:String!
    var PhotoAlbum = CustomPhotoAlbum()

    @IBAction func SubmitButton2(sender: UIButton) {
        let answer2a : String! = self.Answer2a.text
        let answer2b : String! = self.Answer2b.text
        print(answer2a)
        print(answer2b)
    }
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img1.image = UIImage(named: "Volcano")
        img2.image = UIImage(named: "wreath")
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    @IBAction func NextButton(sender: AnyObject) {
        PhotoAlbum.screenShotSaveToAlbum(self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextView : FourthViewController = segue.destinationViewController as! FourthViewController
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
