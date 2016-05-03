//
//  GetDataDelegate.swift
//  Paymint
//
//  Created by Derek Yu on 5/2/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

import Foundation

protocol GetDataDelegate {
    func handleReturnedData(nameField:String, emailField:String)
}