//
//  AppDelegate.swift
//  Paymint
//
//  Created by Derek Yu on 4/11/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var transactionStore = TransactionsStore()
    var userStore = UserStore()



    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        transactionStore.allTransactions.append(Transaction(name: "chipotle", amount: 15.0, date: NSDate(), people: ["cap":Float(0)]))
        let tabBarVC = window?.rootViewController as! UITabBarController
        
        let groupVC = { () -> GroupViewController in
            let vc = tabBarVC.viewControllers![1] as! UINavigationController
            return vc.topViewController as! GroupViewController
        
        }()
        let newBillVC = { () -> NewBillViewController in
            let vc = tabBarVC.viewControllers![2] as! UINavigationController
            return vc.topViewController as! NewBillViewController
        }()
        
        let transactionsVC = { () -> TransactionsListViewController in
            let vc = tabBarVC.viewControllers![0] as! UINavigationController
            return vc.topViewController as! TransactionsListViewController
        }()
        
        newBillVC.transactionStore = transactionStore
        transactionsVC.transactionStore = transactionStore
        groupVC.payGroup = userStore
        newBillVC.payGroup = userStore
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

