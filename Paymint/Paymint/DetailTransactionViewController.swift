//
//  DetailTransactionViewController.swift
//  Paymint
//
//  Created by Derek Yu on 4/28/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

import UIKit

class DetailTransactionViewController:UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var complete_button: UIButton!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    var transactionList:[String]!
    
    var transaction:Transaction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = transaction.name.capitalizedString
        amountLabel.text = String.localizedStringWithFormat("$%.2f", transaction.amount)
        if transaction.active {
            statusLabel.text = "Pending"
            statusLabel.textColor = UIColor(red:0.99, green:0.75, blue:0.18, alpha:1)
        }
       else {
            statusLabel.text = "Complete"
            statusLabel.textColor = UIColor.greenColor()
            complete_button.hidden = true
        }
        transactionList = { () -> [String] in
            let dict = transaction.people as NSDictionary
            return dict.allKeys as! [String]
        }()
        
        let dateFormatter:NSDateFormatter = {
            let formatter = NSDateFormatter()
            formatter.dateStyle = NSDateFormatterStyle.MediumStyle
            return formatter
        }()
        dateLabel.text = dateFormatter.stringFromDate(transaction.date)
        tableView.tableFooterView = UIView()
    }
    @IBAction func completeButton(sender: AnyObject) {
        transaction.active = !(transaction.active)
        navigationController?.popViewControllerAnimated(true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UserCell", forIndexPath: indexPath)
        let name = transactionList[indexPath.row]
        cell.textLabel!.text = name
        cell.detailTextLabel!.text = String.localizedStringWithFormat("$%.2f",transaction.people[name]!)
        
        return cell
        
    }
    
    
}