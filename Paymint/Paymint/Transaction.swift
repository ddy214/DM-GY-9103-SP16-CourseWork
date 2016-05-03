//
//  Transactions.swift
//  Paymint
//
//  Created by Derek Yu on 4/26/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

import Foundation

class Transaction:NSObject {
    var name:String = ""
    var amount:Float = 0
    var date:NSDate
    var active:Bool
    var people:[String:Float]
    
    init(name:String, amount:Float, date:NSDate, people:[String:Float]) {
        self.name = name
        self.amount = amount
        self.date = date
        self.active = true
        self.people = people
    }
    
    override var description: String {
        return name
    }
}