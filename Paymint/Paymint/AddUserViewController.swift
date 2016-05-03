//
//  AddUserViewController.swift
//  Paymint
//
//  Created by Derek Yu on 5/2/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

import UIKit

class AddUserViewController:UIViewController{
    
    var previousVC:GetDataDelegate!
    
    @IBOutlet var nameField: UITextField!
    
    @IBOutlet var emailField: UITextField!
    
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        view.endEditing(true)
        
    }
    @IBAction func submitButton(sender: AnyObject) {
        previousVC.handleReturnedData(nameField.text!, emailField:emailField.text!)
        navigationController?.popViewControllerAnimated(true)
    }
}
