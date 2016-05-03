//
//  NewBillViewController.swift
//  Paymint
//
//  Created by Derek Yu on 4/19/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

import UIKit
protocol NewBillDelegate {
    func handleEdit(name:String, amt:Float)
}

class NewBillViewController:UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, NewBillDelegate{
    var transactionStore:TransactionsStore!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var dateTextField: UITextField!
    
    @IBOutlet var transactionNameField: UITextField!
    
    @IBOutlet var amountField: UITextField!
    
    
    var date:NSDate!
    
    var payGroup:UserStore!
    
    var payDict:[String:Float]!
    
    var payArray:[String]!
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        payDict = [String:Float]()
        for user in payGroup.allUsers {
            payDict[user.name] = 0
        }
        
        payArray = { () -> [String] in
            let dict = payDict as NSDictionary
            return dict.allKeys as! [String]
            }()
        amountField.text = ""
        tableView.reloadData()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        self.navigationController!.navigationBar.barTintColor = UIColor(red:0.16,green:0.73,blue:0.61,alpha:1)
        payDict = [String:Float]()
        for user in payGroup.allUsers {
            payDict[user.name] = 0
        }
        
        payArray = { () -> [String] in
            let dict = payDict as NSDictionary
            return dict.allKeys as! [String]
        }()
    }
    
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        view.endEditing(true)
        tableView.reloadData()
        
    }
    @IBAction func editAmount(sender: AnyObject) {
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        let amount = numberFormatter.numberFromString(amountField.text!)?.floatValue
        var average = Float(0)
        if amount > 0 {
            average = Float(amount!) / Float(payArray.count)
            for i in payArray {
                payDict[i] = average
            }
        }
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
        
        let newT = Transaction(name: transactionNameField.text!, amount: amount!, date: date, people: payDict)
        transactionStore.allTransactions.append(newT)
        tabBarController?.selectedIndex = 0
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell", forIndexPath: indexPath) as! FriendCell
        let cellName = payArray[indexPath.row]
        let cellAmt = payDict[cellName]
        cell.nameLabel.text = cellName
        cell.amountField.text = String.localizedStringWithFormat("%.2f", cellAmt!)
        cell.delegate = self
        return cell
        
    }
    
    func handleEdit(name:String, amt:Float) {
        payDict[name] = amt
        var totalAmount = Float(0)
        for user in payArray{
            totalAmount = totalAmount + payDict[user]!
        }
        amountField.text = String.localizedStringWithFormat("%.2f", totalAmount)
        
        
    }
}
