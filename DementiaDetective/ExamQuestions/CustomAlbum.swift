//
//  CustomAlbum.swift
//  DementiaDetective
//
//  Created by Kay Lab on 11/15/15.
//  Copyright © 2015 MedApp. All rights reserved.
//

import Foundation
import Photos

class CustomPhotoAlbum {
    
    var albumName = ""
    var urlAssets: [UIImage]
    var assetCollection: PHAssetCollection!
    
    init() {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        self.albumName = "Dementia Detective - " + formatter.stringFromDate(NSDate())
        urlAssets = [UIImage]()
        if let assetCollection = fetchAssetCollectionForAlbum() {
            self.assetCollection = assetCollection
            return
        }
        
        PHPhotoLibrary.sharedPhotoLibrary().performChanges({
            PHAssetCollectionChangeRequest.creationRequestForAssetCollectionWithTitle(self.albumName)
            }) { success, _ in
                if success {
                    self.assetCollection = self.fetchAssetCollectionForAlbum()
                }
        }
        
    }
    
    func getAssets() -> [UIImage] {
        return urlAssets
    }
    
    func getAlbumName() -> String{
        return self.albumName
    }
    
    
    
    func fetchAssetCollectionForAlbum() -> PHAssetCollection! {
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "title = %@", self.albumName)
        let collection = PHAssetCollection.fetchAssetCollectionsWithType(.Album, subtype: .Any, options: fetchOptions)
        if collection.firstObject != nil {
            return collection.firstObject as! PHAssetCollection
        }
        
        return nil
    }

    func screenShotSaveToAlbum(view: UIViewController) {
        //        start Image Context
        UIGraphicsBeginImageContextWithOptions(view.view.frame.size, false, UIScreen.mainScreen().scale)
        view.view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let screenShot = UIGraphicsGetImageFromCurrentImageContext()
        //        closes image context
        UIGraphicsEndImageContext()
        
        self.saveImage(screenShot)
        
    }

    func saveImage(image: UIImage) {
        if assetCollection == nil {
            return   // If there was an error upstream, skip the save.
        }
        
        PHPhotoLibrary.sharedPhotoLibrary().performChanges({
            let assetChangeRequest = PHAssetChangeRequest.creationRequestForAssetFromImage(image)
            let assetPlaceholder = assetChangeRequest.placeholderForCreatedAsset
            let albumChangeRequest = PHAssetCollectionChangeRequest(forAssetCollection: self.assetCollection)
            albumChangeRequest!.addAssets([assetPlaceholder!])
            }, completionHandler: nil)
        
        self.urlAssets.append(image)
        NSLog("ADDED image")
     
    }
    
    
}
