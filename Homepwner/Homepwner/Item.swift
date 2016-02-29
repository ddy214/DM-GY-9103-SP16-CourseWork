//
//  Item.swift
//  Homepwner
//
//  Created by Derek Yu on 2/27/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String
    var valueInDollars:Int
    var serialNumber:String?
    let dateCreated:NSDate
    
    init(name:String, serialNumber:String?, valueInDollars:Int ) {
        self.name = name
        self.serialNumber = serialNumber
        self.valueInDollars = valueInDollars
        self.dateCreated = NSDate()
    }
    
    convenience init(random:Bool = false){
        if random{
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork","Mac"]

            var idx = arc4random_uniform(UInt32(adjectives.count))
            
            let randomAdjectives = adjectives[Int(idx)]
            
            idx = arc4random_uniform(UInt32(nouns.count))
            
            let randomNoun = nouns[Int(idx)]
            
            let randomName = "\(randomAdjectives) \(randomNoun)"
            
            let randomValue = Int(arc4random_uniform(100))
            
            let randomSerialNumber = NSUUID().UUIDString.componentsSeparatedByString("-").first!
            
            self.init(name:randomName, serialNumber:randomSerialNumber, valueInDollars:randomValue)
            
            
        }
        else{
            self.init(name:"", serialNumber:nil, valueInDollars:0)
        }
    }
}
