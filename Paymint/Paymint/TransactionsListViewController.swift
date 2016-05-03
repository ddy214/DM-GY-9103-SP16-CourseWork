//
//  TransactionsListViewController.swift
//  Paymint
//
//  Created by Derek Yu on 4/26/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

import UIKit

class TransactionsListViewController:UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    
    var transactionStore:TransactionsStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        
        self.navigationController!.navigationBar.barTintColor = UIColor(red:0.16,green:0.73,blue:0.61,alpha:1)
        self.tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionStore.allTransactions.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("transaction", forIndexPath: indexPath) as! TransactionCell
        let transaction = transactionStore.allTransactions[indexPath.row]
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        cell.title.text = transaction.name
        cell.totalAmt.text = String.localizedStringWithFormat("$%.2f", transaction.amount)
        cell.date.text = dateFormatter.stringFromDate(transaction.date)
        cell.outstandingAmt.text = "0"
        if transaction.active {
            cell.status.text = "Pending"
            cell.status.textColor = UIColor(red:0.99, green:0.75, blue:0.18, alpha:1)
        }
        else {
            cell.status.text = "Completed"
            cell.status.textColor = UIColor.greenColor()
        }
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let currentState = transactionStore.allTransactions[indexPath.row].active
            transactionStore.allTransactions[indexPath.row].active = !(currentState)
            tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DetailTransaction"{
            let dest = segue.destinationViewController as! DetailTransactionViewController
            let row = tableView.indexPathForSelectedRow!.row
            dest.transaction = transactionStore.allTransactions[row]
        }
    }
}