//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Derek Yu on 2/8/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

import UIKit
import Foundation

extension CGFloat {
    static func random()->CGFloat{
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func randomColor()->UIColor{
        let r = CGFloat.random()
        let b = CGFloat.random()
        let g = CGFloat.random()
        return UIColor(red:r, green:g, blue:b, alpha:1)
    }
    
}
class ConversionViewController:UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var celsiusLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded its new")
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        view.backgroundColor = UIColor.randomColor()
    }
    
    let numberFormatter:NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
        
    }()
    
    var farenheitValue:Double? {
        didSet{
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue:Double?{
        if let value = farenheitValue {
            return (value - 32)*(5/9)
        }
        else{
            return nil
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
//        if let text = textField.text where !text.isEmpty{
//            celsiusLabel.text = textField.text
//        }
//        else{
//            celsiusLabel.text = "???"
//        }
        if let text = textField.text, value = Double(text){
            farenheitValue = value
            
        }
        else{
            farenheitValue = nil
        }
    }
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel(){
        if let value = celsiusValue{
            //celsiusLabel.text = "\(value)"
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        }
        else{
            celsiusLabel.text = "???"
        }
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let letterSet:NSCharacterSet = NSCharacterSet.letterCharacterSet()
        let symbolSet:NSCharacterSet = NSCharacterSet.symbolCharacterSet()
        let whitespaceSet:NSCharacterSet = NSCharacterSet.whitespaceCharacterSet()
//        print("Current text: \(textField.text)")
//        print("Replacement text: \(string)")
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
    
        let replacementTextHasDecimalSeparator = string.rangeOfString(".")
        

        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        }
        else if string.rangeOfCharacterFromSet(letterSet) == nil && string.rangeOfCharacterFromSet(symbolSet) == nil && string.rangeOfCharacterFromSet(whitespaceSet) == nil{
        return true
        }

        else {
            return false
        }
        
    }
}

