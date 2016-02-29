//
//  ItemStore.swift
//  Homepwner
//
//  Created by Derek Yu on 2/27/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

import UIKit


class ItemStore {
    
//    init(){
//        for _ in 0..<5{
//            createItem()
//        }
//    }
//    
    var allItems = [Item]()
    
    func createItem()->Item{
        let newItem = Item(random:true)
        allItems.append(newItem)
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
        let movedItem = allItems[fromIndex]
        
        allItems.removeAtIndex(fromIndex)
        allItems.insert(movedItem, atIndex:toIndex)
    }
}
