//
//  EleventhViewController.swift
//  ExamQuestions
//
//  Created by Kay Lab on 11/14/15.
//  Copyright © 2015 Team1. All rights reserved.
//

import UIKit

class EleventhViewController: UIViewController {

    @IBOutlet var img4: UIImageView!
   
    var PhotoAlbum = CustomPhotoAlbum()
    
    override func viewDidLoad() {
        img4.image = UIImage(named: "example1")
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func NextButton(sender: AnyObject) {
        PhotoAlbum.screenShotSaveToAlbum(self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextView : TwelfthViewController = segue.destinationViewController as! TwelfthViewController
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
