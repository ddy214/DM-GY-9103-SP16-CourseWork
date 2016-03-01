//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Derek Yu on 2/27/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

import UIKit

class ItemsViewController:UITableViewController{
    
//    @IBAction func addNewItem(sender:AnyObject){
////        let lastRow = tableView.numberOfRowsInSection(0)
////        let indexPath = NSIndexPath(forRow: lastRow, inSection: 0)
////        
////        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
////        
//        let newItem = itemStore.createItem()
//        if let index = itemStore.allItems.indexOf(newItem){
//            let indexPath = NSIndexPath(forRow: index, inSection: 0)
//            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
//        }
//        
//
//    }
    
//    @IBAction func toggleEditingMode(sender:AnyObject){
//        if editing{
//            sender.setTitle("Edit", forState: .Normal)
//            setEditing(false, animated: true)
//            
//        }
//        else{
//            sender.setTitle("Done", forState: .Normal)
//            setEditing(true, animated: true)
//        }
//    }
    
    var itemStore:ItemStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        
        tableView.scrollIndicatorInsets = insets
        let imageView:UIImageView?
        let image = UIImage(named:"Icon@2x")
        imageView = UIImageView(image:image)
        tableView.backgroundView = imageView!
        //tableView.rowHeight = 60
        //tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.estimatedRowHeight = 65
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return itemStore.allItems.count
        if section == 0 {
            return itemStore.lessItems.count
        }
        else{
            return itemStore.moreItems.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "UITableViewCell")
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
//        let cell = tableView.dequeueReusableCellWithIdentifier("UI", forIndexPath: indexPath) as! ItemCell
        
        //cell.updateLabels()
        
        //let item = itemStore.allItems[indexPath.row]
//        cell.textLabel?.text = item.name

//        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        if indexPath.section == 0 {
            let item = itemStore.lessItems[indexPath.row]
            if item.name == "No More Items" {
                cell.textLabel?.text = item.name
                return cell
            }
            cell.textLabel?.text = item.name
           // cell.serialNumberLabel.text = item.serialNumber
            cell.detailTextLabel?.text = "$\(item.valueInDollars)"
            cell.textLabel?.font = UIFont.systemFontOfSize(20)
        }
        else {
            let item = itemStore.moreItems[indexPath.row]
            if item.name == "No More Items" {
                cell.textLabel?.text = item.name
                return cell
            }
            cell.textLabel?.text = item.name
            //cell.serialNumberLabel.text = item.serialNumber
            cell.detailTextLabel?.text = "$\(item.valueInDollars)"
            cell.textLabel?.font = UIFont.systemFontOfSize(20)
        }

        
        return cell
    }
    
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete{
//            let item = itemStore.allItems[indexPath.row]
//            
//            let title = "Delete \(item.name)?"
//            let message = "Are you sure you want to delete this item?"
//            
//            let ac = UIAlertController(title:title, message:message,preferredStyle: .ActionSheet)
//            
//            let cancelAction = UIAlertAction(title:"Cancel", style: .Cancel, handler:nil)
//            ac.addAction(cancelAction)
//            
//            let deleteAction = UIAlertAction(title:"Delete", style: .Destructive, handler:{(action) -> Void in
//                self.itemStore.removeItem(item)
//                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
//            })
//            ac.addAction(deleteAction)
//            presentViewController(ac, animated: true, completion: nil)
//        }
//    }
    
//    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
//        itemStore.moveItemAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
//    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Less Than 50"
        }
        
        else {
            return "Greater Than 50"
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        //print("\(itemStore.lessItems.count)")
        
        if indexPath.section == 0 {
            let last = itemStore.lessItems.count-1
            if indexPath.row == last {

                return 44.0
            }
        }
        else if indexPath.section == 1 {
            let last = itemStore.moreItems.count-1
            if indexPath.row == last {

                return 44.0
            }
        }
        return 60.0

    }
}
