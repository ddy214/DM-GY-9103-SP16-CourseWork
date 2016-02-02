//
//  ViewController.swift
//  Quiz
//
//  Created by Derek Yu on 2/2/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var answerLabel: UILabel!
    
    let questions:[String] = ["From what is cognac made?", "What is 7+7?","What is the capital of Vermont?"]
    let answers:[String] = ["Grapes", "14","Montpelier"]
    
    var currentIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[0]
    }
    

    @IBAction func nextQuestButton(sender: AnyObject) {
        ++currentIndex
        if currentIndex >= questions.count{
            currentIndex = 0
        }
        let question:String = questions[currentIndex]
        questionLabel.text = question
        answerLabel.text = "???"
        
    }

    
    @IBAction func showAnswer(sender: AnyObject) {
        let answer:String = answers[currentIndex]
        answerLabel.text = answer
    }
}

