//
//  ItemStore.swift
//  Homepwner
//
//  Created by Derek Yu on 2/27/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

import UIKit


class ItemStore {
    
    init(){
        if let archivedItems = NSKeyedUnarchiver.unarchiveObjectWithFile(itemArchiveURL.path!) as? [Item] {
            allItems += archivedItems
        }
        else {
            let newItem = Item(random: true)
            newItem.name = "No More Rows"
            allItems.append(newItem)
        }
    }
//    init(){
////        for _ in 0..<5{
////            createItem()
////        }
//        
//        let newItem = Item(random: true)
//        newItem.name = "No More Rows"
//        allItems.append(newItem)
//    }
//    
    var allItems = [Item]()
    let itemArchiveURL:NSURL = {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.URLByAppendingPathComponent("items.archive")
    }()
    func createItem()->Item{
        let emptyItem = allItems.popLast()
        let newItem = Item(random:true)
        allItems.append(newItem)
        allItems.append(emptyItem!)
        
        return newItem
    }
    
    func removeItem(item:Item){
        if let index = allItems.indexOf(item){
            allItems.removeAtIndex(index)
        }
    }
    
    func moveItemAtIndex(fromIndex:Int, toIndex:Int){
        if fromIndex == toIndex{
            return
        }
        if toIndex == allItems.count-1 {
            return
        }
        let movedItem = allItems[fromIndex]
        allItems.removeAtIndex(fromIndex)
        allItems.insert(movedItem, atIndex:toIndex)
    }
    func saveChanges() -> Bool {
        print("Saving items to : \(itemArchiveURL.path!)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path!)
    }
}
