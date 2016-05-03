//
//  DetailTransactionViewController.swift
//  Paymint
//
//  Created by Derek Yu on 4/28/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

import UIKit

class DetailTransactionViewController:UIViewController{
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    var transaction:Transaction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = transaction.name
        amountLabel.text = String.localizedStringWithFormat("$%.2f", transaction.amount)
        if transaction.active {
            statusLabel.text = "Pending"
            
        } else {
            statusLabel.text = "Complete"
        }
    }
    @IBAction func completeButton(sender: AnyObject) {
        transaction.active = !(transaction.active)
        navigationController?.popViewControllerAnimated(true)
    }
}