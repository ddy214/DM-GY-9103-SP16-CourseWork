//
//  NewBillViewController.swift
//  Paymint
//
//  Created by Derek Yu on 4/19/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

import UIKit

class NewBillViewController:UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource{
    var transactionStore:TransactionsStore!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var dateTextField: UITextField!
    
    @IBOutlet var transactionNameField: UITextField!
    
    @IBOutlet var amountField: UITextField!
    
    
    var date:NSDate!
    
    var payGroup:UserStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        self.navigationController!.navigationBar.barTintColor = UIColor(red:0.16,green:0.73,blue:0.61,alpha:1)
    
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        view.endEditing(true)
        
    }
    
    @IBAction func chooseDate(sender: UITextField) {
        if dateTextField.text == "" {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            dateTextField.text = dateFormatter.stringFromDate(NSDate())
        }
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerChanged), forControlEvents: UIControlEvents.ValueChanged)
    }


    func datePickerChanged(sender:UIDatePicker){
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        dateTextField.text = dateFormatter.stringFromDate(sender.date)
        date = sender.date
        
    }
    @IBAction func submit(sender: AnyObject) {
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        let amount = numberFormatter.numberFromString(amountField.text!)?.floatValue
        
        let newT = Transaction(name: transactionNameField.text!, amount: amount!, date: date)
        transactionStore.allTransactions.append(newT)
        tabBarController?.selectedIndex = 0
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payGroup.allUsers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell", forIndexPath: indexPath)
        cell.textLabel!.text = payGroup.allUsers[indexPath.row].name
        return cell
    }
    
    func editAmount() {
        
    }
    
    
}
