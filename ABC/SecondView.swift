//
//  SecondView.swift
//  project12
//
//  Created by Sophia on 6/14/15.
//  Copyright (c) 2015 Sophia. All rights reserved.
//

import UIKit

class SecondView: UIViewController {
    
    
    @IBOutlet weak var stats1: UIButton!
    @IBOutlet weak var back1: UIButton!
    @IBOutlet weak var learn1: UIButton!
    @IBOutlet weak var wordlist1: UIButton!
    @IBOutlet weak var test1: UIButton!
    
    
    var wordslist:Array<Array<String>>!
    var unitnumber:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        test1.layer.cornerRadius = 8

        test1.titleLabel!.font = UIFont(name: "Chalkboard SE", size: 27)
        test1.layer.shadowOffset = CGSizeMake(5, 5)
        test1.layer.shadowOpacity = 1.0
        test1.layer.shadowRadius = 5
        test1.layer.shadowColor = UIColor.blueColor().CGColor
        stats1.layer.cornerRadius = 8

        stats1.titleLabel!.font = UIFont(name: "Chalkboard SE", size: 27)
        stats1.layer.shadowOffset = CGSizeMake(5, 5)
        stats1.layer.shadowOpacity = 1.0
        stats1.layer.shadowRadius = 5
        stats1.layer.shadowColor = UIColor.blueColor().CGColor
        learn1.layer.cornerRadius = 8

        learn1.titleLabel!.font = UIFont(name: "Chalkboard SE", size: 27)
        learn1.layer.shadowOffset = CGSizeMake(5, 5)
        learn1.layer.shadowOpacity = 1.0
        learn1.layer.shadowRadius = 5
        learn1.layer.shadowColor = UIColor.blueColor().CGColor

        wordlist1.layer.cornerRadius = 4
        wordlist1.layer.borderWidth = 2.0
        
        wordlist1.layer.borderColor = UIColor.blueColor().CGColor
        wordlist1.titleLabel!.font = UIFont(name: "Chalkboard SE", size: 15)
        wordlist1.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
        wordlist1.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 0.7)
        wordlist1.layer.shadowOffset = CGSizeMake(5, 5)
        wordlist1.layer.shadowOpacity = 1.0
        wordlist1.layer.shadowRadius = 5
        wordlist1.layer.shadowColor = UIColor.blueColor().CGColor
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func unwindToSecondView(sender: UIStoryboardSegue) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ToLearn") {
            
            let tableVC = segue.destinationViewController as! UINavigationController
            let tVC = tableVC.topViewController as! LearnView
            tVC.list = wordslist
            tVC.unitnum = unitnumber
            
        } else if (segue.identifier == "ToTest") {
            let tableVC = segue.destinationViewController as! UINavigationController
            let tVC = tableVC.topViewController as! TestView
            tVC.wordlist = wordslist
            tVC.unitnum = unitnumber
        } else if (segue.identifier == "ToCompleteList") {
            let tableVC = segue.destinationViewController as! UINavigationController
            let tVC = tableVC.topViewController as! TableView
            tVC.words = wordslist
            tVC.unitnum = unitnumber
        } else if (segue.identifier == "ToStatistics") {
            let tableVC = segue.destinationViewController as! UINavigationController
            let tVC = tableVC.topViewController as! StatsView
            tVC.unit = unitnumber
            tVC.allwords = wordslist
        }
    }
    

}
