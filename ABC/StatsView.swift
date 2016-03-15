//
//  StatsView.swift
//  project12
//
//  Created by Sophia on 6/16/15.
//  Copyright (c) 2015 Sophia. All rights reserved.
//

import UIKit

class StatsView: UIViewController {
    
    @IBOutlet weak var unit1: UILabel!
    @IBOutlet weak var recent1: UILabel!
    @IBOutlet weak var result1: UILabel!
    @IBOutlet weak var customlist1: UIButton!
    @IBOutlet weak var wronglist1: UIButton!
    @IBOutlet weak var viewbox1: UIView!
    @IBOutlet weak var tokens1: UILabel!
    
    var wrong1 = NSUserDefaults()
    var customl:Array<Int>!
    var wronglistl:Array<Array<String>> = []
    var testresult:Array<Int>!
    var teststr:String!
    var unit:String!
    var keystring1:String!
    var keystring2:String!
    var keystring3:String!
    var allwords:Array<Array<String>>!
    
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wrong1 = NSUserDefaults.standardUserDefaults()
        if let co = wrong1.objectForKey("\(unit)c") as? Int {
            if (co == 1) {
                star1.image = UIImage(named: "star1")
            } else {
                star1.image = UIImage(named: "starg")
            }

        } else {
            star1.image = UIImage(named: "starg")
            wrong1.setInteger(0, forKey: "\(unit)c")
            wrong1.synchronize()
        }
        
        if let ct = wrong1.objectForKey("\(unit)t") as? Int {
            if (ct == 0) {
                star2.image = UIImage(named: "starg")
                star3.image = UIImage(named: "starg")
                star4.image = UIImage(named: "starg")
            } else if (ct == 1) {
                star2.image = UIImage(named: "starg")
                
                star4.image = UIImage(named: "starg")
            } else if (ct == 2) {
                star4.image = UIImage(named: "starg")
            }
            
        } else {
            star2.image = UIImage(named: "starg")
            star3.image = UIImage(named: "starg")
            star4.image = UIImage(named: "starg")
            wrong1.setInteger(0, forKey: "\(unit)t")
            wrong1.synchronize()
        }
        if (unit == "unit1") {
            keystring1 = "custom1"
            keystring2 = "wrong1"
            keystring3 = "testresult1"
            unit1.text = "Unit 1"
        } else if (unit == "unit2") {
            keystring1 = "custom2"
            keystring2 = "wrong2"
            keystring3 = "testresult2"
            unit1.text = "Unit 2"
        } else if (unit == "unit3") {
            keystring1 = "custom3"
            keystring2 = "wrong3"
            keystring3 = "testresult3"
            unit1.text = "Unit 3"
        } else if (unit == "unit4") {
            keystring1 = "custom4"
            keystring2 = "wrong4"
            keystring3 = "testresult4"
            unit1.text = "Unit 4"
        } else if (unit == "unit5") {
            keystring1 = "custom5"
            keystring2 = "wrong5"
            keystring3 = "testresult5"
            unit1.text = "Unit 5"
        }
        if let wronglist = wrong1.arrayForKey(keystring2) {
            
            wronglistl = wronglist as! Array<Array<String>>
        } else {
            
        }
        if let testr = wrong1.arrayForKey(keystring3) {
            testresult = testr as! Array<Int>
            teststr = "You got \(testresult[0]) out of \(testresult[1]) right"
        } else {
            testresult = []
            teststr = "No Test Taken Yet"
        }
        viewbox1.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 0.7)
        viewbox1.layer.shadowOffset = CGSizeMake(5, 5)
        viewbox1.layer.shadowOpacity = 1.0
        viewbox1.layer.shadowRadius = 5
        viewbox1.layer.shadowColor = UIColor.blueColor().CGColor
        viewbox1.layer.cornerRadius = 15
        viewbox1.layer.borderColor = UIColor.lightGrayColor().CGColor
        viewbox1.layer.borderWidth = 4
        
        unit1.font = UIFont(name: "Chalkboard SE", size: 22)
        recent1.font = UIFont(name: "Chalkboard SE", size: 22)
        result1.font = UIFont(name: "Chalkboard SE", size: 20)
        result1.text = teststr
        customlist1.titleLabel!.font = UIFont(name: "Chalkboard SE", size: 19)
        customlist1.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
        customlist1.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 0.7)
        customlist1.layer.borderWidth = 2.0
        customlist1.layer.borderColor = UIColor.blueColor().CGColor
        customlist1.layer.shadowOffset = CGSizeMake(5, 5)
        customlist1.layer.shadowOpacity = 1.0
        customlist1.layer.shadowRadius = 5
        customlist1.layer.shadowColor = UIColor.blueColor().CGColor
        customlist1.layer.cornerRadius = 8
        wronglist1.titleLabel!.font = UIFont(name: "Chalkboard SE", size: 19)
        wronglist1.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
        wronglist1.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 0.7)
        wronglist1.layer.borderWidth = 2.0
        wronglist1.layer.borderColor = UIColor.blueColor().CGColor
        wronglist1.layer.shadowOffset = CGSizeMake(5, 5)
        wronglist1.layer.shadowOpacity = 1.0
        wronglist1.layer.shadowRadius = 5
        wronglist1.layer.shadowColor = UIColor.blueColor().CGColor
        wronglist1.layer.cornerRadius = 8
        tokens1.font = UIFont(name: "Chalkboard SE", size: 17)
        tokens1.textColor = UIColor.orangeColor()
    }
    
    @IBAction func ShowCustomList(sender: AnyObject) {
        
    }
    @IBAction func showwrongwords(sender: AnyObject) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func unwindToStatsView(sender: UIStoryboardSegue) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "ToWrongTableFromStats") {
            let tableVC = segue.destinationViewController as! WrongWordTableView
            tableVC.words = wronglistl
            tableVC.unitnum = unit
        }
        
        if (segue.identifier == "ToCustomListFromStats") {
            if let customlist = wrong1.arrayForKey(keystring1) {
                
                customl = customlist as! Array<Int>
            } else {
                customl = []
            }
            let tableVC1 = segue.destinationViewController as! CustomListTableView
            tableVC1.wordindex = customl
            tableVC1.unit = unit
            tableVC1.words = allwords
        }
    }

}
