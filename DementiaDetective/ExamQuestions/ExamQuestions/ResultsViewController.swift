//
//  ResultsViewController.swift
//  DementiaDetective
//
//  Created by Kay Lab on 11/13/15.
//  Copyright © 2015 MedApp. All rights reserved.


import UIKit
import MessageUI
import Photos

//Still need to Set Up zip
class ResultsViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    var PhotoAlbum = CustomPhotoAlbum()
    
    @IBOutlet var btnSendEmailRequest: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SendResults(sender: AnyObject) {
        let mailComposeViewController = configuredMailComposeViewController()
        mailComposeViewController.mailComposeDelegate = self
        if MFMailComposeViewController.canSendMail(){
            mailComposeViewController.mailComposeDelegate = self
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
//            self.dismissViewControllerAnimated(false, completion: nil)
        }
        else {
            self.showSendEmailErrorAlert()
            
        }

    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func configuredMailComposeViewController() ->MFMailComposeViewController {
        NSLog(PhotoAlbum.getAlbumName())
        let mailComposerVC = MFMailComposeViewController()
        
        mailComposerVC.setSubject("Dementia Dectective: Sage Test Results")
        mailComposerVC.setMessageBody("this is a test",isHTML: true)
        var count = 0
        NSLog(String(PhotoAlbum.getAssets().count))
        for i in PhotoAlbum.getAssets() {
            count++
            let imageData = UIImagePNGRepresentation(i)
            mailComposerVC.addAttachmentData(imageData!, mimeType: "image/png", fileName: "DementiaDetectiveTestResults" + String(count))
            NSLog("ADDED Attachment")
        }
        
        
        return mailComposerVC
    }
    
    func showSendEmailErrorAlert(){
        let sendEmailErrorAlert = UIAlertController(title: "Could Not Send Email", message:  "Your device is unable to send emails. Please check email configuration and try again.", preferredStyle: .Alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .Cancel) { (action:UIAlertAction!) in
            print("you have pressed OK button");
        }
        sendEmailErrorAlert.addAction(OKAction)
        self.presentViewController(sendEmailErrorAlert, animated: true, completion:nil)
        
    }
}

