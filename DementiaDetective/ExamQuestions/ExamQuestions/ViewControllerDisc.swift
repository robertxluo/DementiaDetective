//
//  ViewController.swift
//  ExamQuestions
//
//  Created by Kay Lab on 11/12/15.
//  Copyright © 2015 Team1. All rights reserved.
//

import UIKit

class ViewControllerDisc: UIViewController {

    @IBOutlet var `switch`: UISwitch!

    var PhotoAlbum = CustomPhotoAlbum()
    @IBOutlet var textView: UITextView!

    var state = "off"
    
    @IBAction func NextButton(sender: AnyObject) {
        
    }
    
    @IBAction func SwitchPressed(sender: UISwitch) {
        if state == "on"{
            state = "off"
        }
        else {
        state = "on"
        }
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextView : SecondViewController = segue.destinationViewController as! SecondViewController
        nextView.PhotoAlbum = self.PhotoAlbum
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if state == "on"{
            return true
        }
        else{
            return false
        }
    }
    
 
    
    override func viewDidLoad() {
        textView.editable = false
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

