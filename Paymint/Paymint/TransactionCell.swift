//
//  TransactionCell.swift
//  Paymint
//
//  Created by Derek Yu on 4/26/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

import UIKit

class TransactionCell:UITableViewCell {
    @IBOutlet var title: UILabel!
    
    @IBOutlet var status: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var totalAmt: UILabel!
    @IBOutlet var outstandingAmt: UILabel!
}
