//
//  ViewController.swift
//  project12
//
//  Created by Sophia on 6/14/15.
//  Copyright (c) 2015 Sophia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var Unit2: UIButton!
    @IBOutlet weak var Unit1: UIButton!
    @IBOutlet weak var Unit3: UIButton!
    @IBOutlet weak var Unit4: UIButton!
    @IBOutlet weak var Unit5: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcome.font = UIFont(name: "Chalkboard SE", size: 29)
        
        welcome.layer.shadowOpacity = 0.7
        welcome.layer.shadowColor = UIColor.blackColor().CGColor
        welcome.layer.shadowOffset = CGSizeMake(5, 5)
        Unit1.layer.cornerRadius = 8
        Unit1.backgroundColor = UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 0.7)
        

        Unit1.titleLabel!.font = UIFont(name: "Chalkboard SE", size: 24)
        Unit1.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
        Unit1.layer.shadowOffset = CGSizeMake(5, 5)
        Unit1.layer.shadowOpacity = 1.0
        Unit1.layer.shadowRadius = 5
        Unit1.layer.shadowColor = UIColor.blueColor().CGColor
        Unit2.layer.cornerRadius = 8
        Unit2.backgroundColor = UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 0.7)

        Unit2.titleLabel!.font = UIFont(name: "Chalkboard SE", size: 24)
        Unit2.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
        Unit2.layer.shadowOffset = CGSizeMake(5, 5)
        Unit2.layer.shadowOpacity = 1.0
        Unit2.layer.shadowRadius = 5
        Unit2.layer.shadowColor = UIColor.blueColor().CGColor
        Unit3.layer.cornerRadius = 8
        Unit3.backgroundColor = UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 0.7)

        Unit3.titleLabel!.font = UIFont(name: "Chalkboard SE", size: 24)
        Unit3.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
        Unit3.layer.shadowOffset = CGSizeMake(5, 5)
        Unit3.layer.shadowOpacity = 1.0
        Unit3.layer.shadowRadius = 5
        Unit3.layer.shadowColor = UIColor.blueColor().CGColor
        Unit4.layer.cornerRadius = 8
        Unit4.backgroundColor = UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 0.7)

        Unit4.titleLabel!.font = UIFont(name: "Chalkboard SE", size: 24)
        Unit4.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
        Unit4.layer.shadowOffset = CGSizeMake(5, 5)
        Unit4.layer.shadowOpacity = 1.0
        Unit4.layer.shadowRadius = 5
        Unit4.layer.shadowColor = UIColor.blueColor().CGColor
        Unit5.layer.cornerRadius = 8
        Unit5.backgroundColor = UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 0.7)

        Unit5.titleLabel!.font = UIFont(name: "Chalkboard SE", size: 24)
        Unit5.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
        Unit5.layer.shadowOffset = CGSizeMake(5, 5)
        Unit5.layer.shadowOpacity = 1.0
        Unit5.layer.shadowRadius = 5
        Unit5.layer.shadowColor = UIColor.blueColor().CGColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func unwindToMainView(sender: UIStoryboardSegue) {
        
    }
    
    //get the words for this unit from the csv file
    func getWords(unit: String) -> Array<Array<String>> {
        let fileUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(unit, ofType: "csv")!)
        
        var listOfList:Array<Array<String>> = []
        do {
            let text = try String(contentsOfURL: fileUrl, encoding: NSUTF8StringEncoding);
            let rawWords = text.componentsSeparatedByString("\r\n");
            for str:String in rawWords {
                
                if (str != "") {
                    let newword:Array<String> = str.componentsSeparatedByString(",")
                    
                    if (newword[1] != "type") {
                        listOfList.append(newword)
                    }
                }
            }
            return listOfList
        } catch {
            
            return [["survey","n.","调查，测验"]]
        }
            
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "Unit1") {
            let tableVC = segue.destinationViewController as! SecondView
            tableVC.wordslist = getWords("unit_1")
            tableVC.unitnumber = "unit1"
            
        } else if (segue.identifier == "Unit2") {
            let tableVC = segue.destinationViewController as! SecondView
            tableVC.wordslist = getWords("unit_2")
            tableVC.unitnumber = "unit2"
        } else if (segue.identifier == "Unit3") {
            let tableVC = segue.destinationViewController as! SecondView
            tableVC.wordslist = getWords("unit_3")
            tableVC.unitnumber = "unit3"
        } else if (segue.identifier == "Unit4") {
            let tableVC = segue.destinationViewController as! SecondView
            tableVC.wordslist = getWords("unit_4")
            tableVC.unitnumber = "unit4"
        } else if (segue.identifier == "Unit5") {
            let tableVC = segue.destinationViewController as! SecondView
            tableVC.wordslist = getWords("unit_5")
            tableVC.unitnumber = "unit5"
        }
    }


}

