//
//  ViewController.swift
//  Paymint
//
//  Created by Derek Yu on 4/11/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, GetDataDelegate {
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var groupNameField: UITextField!
    var nameOfGroup:String?
    var payGroup:UserStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefault = NSUserDefaults.standardUserDefaults()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        
        self.navigationController!.navigationBar.barTintColor = UIColor(red:0.16,green:0.73,blue:0.61,alpha:1)
        self.tableView.tableFooterView = UIView()
        
        if let name = userDefault.stringForKey("groupName"){
            groupNameField.text = name
        }
        
        self.groupNameField.attributedPlaceholder = NSAttributedString(string:"Please Type A Group Name", attributes: [NSForegroundColorAttributeName:UIColor.whiteColor()])
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        let userDefault = NSUserDefaults.standardUserDefaults()
        userDefault.setValue(nameOfGroup, forKey: "groupName")
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddFriend"{
            let destVC = segue.destinationViewController as! AddUserViewController
            destVC.previousVC = self
        }
    }
    
    @IBAction func dismissKeyBoard(sender: AnyObject) {
        groupNameField!.resignFirstResponder()
    }
    
    @IBAction func editingGroupName(sender: AnyObject) {
        nameOfGroup = groupNameField.text
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("titleCell", forIndexPath: indexPath)
        let item = payGroup.allUsers[indexPath.row]
        cell.textLabel!.text = item.name
        cell.detailTextLabel!.text = item.email
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payGroup.allUsers.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    

    
    func handleReturnedData(nameField: String, emailField: String) {
        payGroup.allUsers.append(User(name: nameField, email: emailField))
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    
}

