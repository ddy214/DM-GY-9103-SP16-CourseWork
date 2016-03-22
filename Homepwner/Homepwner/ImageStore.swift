//
//  ImageStore.swift
//  Homepwner
//
//  Created by Derek Yu on 3/21/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

//import Foundation
import UIKit

class ImageStore {
    
    let cache = NSCache()
    
    func setImage(image: UIImage, forKey key:String){
        cache.setObject(image, forKey:key)
        
        let imageURL = imageURLForKey(key)
        
        if let data = UIImageJPEGRepresentation(image, 0.5){
            data.writeToURL(imageURL, atomically: true)
        }
    }
    
    func imageForKey(key:String) -> UIImage? {
        //return cache.objectForKey(key) as? UIImage
        if let existingImage = cache.objectForKey(key) as? UIImage {
            return existingImage
        }
        let imageURL = imageURLForKey(key)
            guard let imageFromDisk = UIImage(contentsOfFile: imageURL.path!) else {
                return nil
            }
        cache.setObject(imageFromDisk, forKey: key)
        return imageFromDisk
        }
        
    
    
    func deleteImageForKey(key:String) {
        cache.removeObjectForKey(key)
        let imageURL = imageURLForKey(key)
    //NSFileManager.defaultManager().removeItemAtURL(imageURL)
        do {
            try NSFileManager.defaultManager().removeItemAtURL(imageURL)
        }
        catch let deleteError {
            print("Error removing the iamge from disk: \(deleteError)")
        }
    }
    
    func imageURLForKey(key: String) -> NSURL {
        let documentDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentDirectories.first!
        
        return documentDirectory.URLByAppendingPathComponent(key)
    }
}