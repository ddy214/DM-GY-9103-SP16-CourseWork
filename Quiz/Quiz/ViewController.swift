//
//  ViewController.swift
//  Quiz
//
//  Created by Derek Yu on 2/2/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var currentQuestionLabel:UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint:NSLayoutConstraint!
    @IBOutlet var nextQuestionLabel:UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint:NSLayoutConstraint!
    

    @IBOutlet weak var answerLabel: UILabel!
    
    let questions:[String] = ["From what is cognac made?", "What is 7+7?","What is the capital of Vermont?"]
    let answers:[String] = ["Grapes", "14","Montpelier"]
    
    var currentIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //questionLabel.text = questions[currentIndex]
        currentQuestionLabel.text = questions[currentIndex]
        updateOffScreenLabel()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //questionLabel.alpha = 0
        nextQuestionLabel.alpha = 0
    }

    @IBAction func nextQuestButton(sender: AnyObject) {
        ++currentIndex
        if currentIndex >= questions.count{
            currentIndex = 0
        }
        let question:String = questions[currentIndex]
        //questionLabel.text = question
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransition()
        
    }

    
    @IBAction func showAnswer(sender: AnyObject) {
        let answer:String = answers[currentIndex]
        answerLabel.text = answer
    }
    
    func animateLabelTransition(){
//        let animateClosure = {
//            () -> Void in
//            self.questionLabel.alpha = 1;
//            
//        }
//        
//        UIView.animateWithDuration(0.5, animations: animateClosure)
        
//        UIView.animateWithDuration(0.5, animations: {
//            //self.questionLabel.alpha = 1
//            self.currentQuestionLabel.alpha = 0
//            self.nextQuestionLabel.alpha = 1
//        })
        view.layoutIfNeeded()
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
//        UIView.animateWithDuration(0.5, delay: 0, options: [.CurveLinear],
//            animations: {
//                self.currentQuestionLabel.alpha = 0
//                self.nextQuestionLabel.alpha = 1
//                self.view.layoutIfNeeded()
//            },
//            completion: { _ in
//                swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
//                swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
//                self.updateOffScreenLabel()
//        })
        UIView.animateWithDuration(<#T##duration: NSTimeInterval##NSTimeInterval#>, delay: <#T##NSTimeInterval#>, usingSpringWithDamping: <#T##CGFloat#>, initialSpringVelocity: <#T##CGFloat#>, options: <#T##UIViewAnimationOptions#>, animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
    }
    
    func updateOffScreenLabel(){
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
}

