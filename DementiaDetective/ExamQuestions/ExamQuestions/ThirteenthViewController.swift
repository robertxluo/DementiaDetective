//
//  ThirteenthViewController.swift
//  ExamQuestions
//
//  Created by Kay Lab on 11/14/15.
//  Copyright © 2015 Team1. All rights reserved.
//

import UIKit

class ThirteenthViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    @IBOutlet var image2: UIImageView!
    @IBOutlet var image3: UIImageView!
    @IBOutlet var image4: UIImageView!
    var PhotoAlbum = CustomPhotoAlbum()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches{
            let location = touch.locationInView(self.view)
            
            if image.frame.contains(location){
                image.center = location
            }
            else if image2.frame.contains(location){
                image2.center = location
            }
            else if image3.frame.contains(location){
                image3.center = location
            }
            else if image4.frame.contains(location){
                image4.center = location
            }
        }
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches{
            let location = touch.locationInView(self.view)
            
            if image.frame.contains(location){
                image.center = location
            }
            else if image2.frame.contains(location){
                image2.center = location
            }
            else if image3.frame.contains(location){
                image3.center = location
            }
            else if image4.frame.contains(location){
                image4.center = location
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches{
            let location = touch.locationInView(self.view)
            if image.frame.contains(location){
                image.center = location
            }
            else if image2.frame.contains(location){
                image2.center = location
            }
            else if image3.frame.contains(location){
                image3.center = location
            }
            else if image4.frame.contains(location){
                image4.center = location
            }
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextView : FourteenthViewController = segue.destinationViewController as! FourteenthViewController
        nextView.PhotoAlbum = self.PhotoAlbum
    }

    
    @IBAction func NextButton(sender: AnyObject) {
        PhotoAlbum.screenShotSaveToAlbum(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
