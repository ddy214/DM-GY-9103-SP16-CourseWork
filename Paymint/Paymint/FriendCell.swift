//
//  FriendCell.swift
//  Paymint
//
//  Created by Derek Yu on 5/3/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

import UIKit

class FriendCell:UITableViewCell {
    var delegate:NewBillDelegate!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var amountField: UITextField!
    @IBAction func changeAmt(sender: AnyObject) {
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        var amount = numberFormatter.numberFromString(amountField.text!)?.floatValue
        if amount == nil {
            amount = Float(0)
        }
        delegate.handleEdit(nameLabel.text!, amt: amount!)

    }
}
