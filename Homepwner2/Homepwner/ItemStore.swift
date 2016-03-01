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
        for _ in 0..<5{
            createItem()
        }
        let item = Item(random: true)
        item.name = "No More Items"
        lessItems.append(item)
        moreItems.append(item)
    }
    
    var lessItems = [Item]()
    
    var moreItems = [Item]()
    
    func createItem()->Item{
        let newItem = Item(random:true)
        if newItem.valueInDollars > 50 {
            moreItems.append(newItem)
        }
        else {
            lessItems.append(newItem)
        }
//        allItems.append(newItem)
        return newItem
    }
    
//    func removeItem(item:Item){
//        if let index = allItems.indexOf(item){
//            allItems.removeAtIndex(index)
//        }
//    }
    
//    func moveItemAtIndex(fromIndex:Int, toIndex:Int){
//        if fromIndex == toIndex{
//            return
//        }
//        let movedItem = allItems[fromIndex]
//        
//        allItems.removeAtIndex(fromIndex)
//        allItems.insert(movedItem, atIndex:toIndex)
//    }
}
