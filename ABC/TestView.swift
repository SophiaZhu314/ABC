//
//  TestView.swift
//  project12
//
//  Created by Sophia on 6/14/15.
//  Copyright (c) 2015 Sophia. All rights reserved.
//

import UIKit

class TestView: UIViewController {
    
    @IBOutlet weak var word1: UILabel!
    @IBOutlet weak var progressbar: UIProgressView!
    
    @IBOutlet weak var type1: UILabel!
    @IBOutlet weak var text1: UITextField!
    
    @IBOutlet weak var ok1: UIButton!
    @IBOutlet weak var wrong1: UIButton!
    @IBOutlet weak var right1: UIButton!
    @IBOutlet weak var viewlist1: UIButton!
    @IBOutlet weak var starview: UIView!
    @IBOutlet weak var starl1: UILabel!
    @IBOutlet weak var starl2: UILabel!
    @IBOutlet weak var starb: UIButton!
    
    var waittime = 8
    var timerCount:Int = 0
    var timer = NSTimer()
    var wronglist:Array<Array<String>> = []
    var wrongl1 = NSUserDefaults()
    var wordlist:Array<Array<String>>!
    var numlist:Array<Int> = [];
    var at1:Int!
    var currentTime:Int = 0
    var keystring1:String!
    var keystring2:String!
    var unitnum:String!
    var countall:Int!
    var wordcount:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        wrongl1 = NSUserDefaults.standardUserDefaults()
        if (unitnum == "unit1") {
            keystring1 = "wrong1"
            keystring2 = "testresult1"
        } else if (unitnum == "unit2") {
            keystring1 = "wrong2"
            keystring2 = "testresult2"
        } else if (unitnum == "unit3") {
            keystring1 = "wrong3"
            keystring2 = "testresult3"
        } else if (unitnum == "unit4") {
            keystring1 = "wrong4"
            keystring2 = "testresult4"
        } else if (unitnum == "unit5") {
            keystring1 = "wrong5"
            keystring2 = "testresult5"
        }
        
        starl1.font = UIFont(name: "Chalkboard SE", size: 18)
        starl2.font = UIFont(name: "Chalkboard SE", size: 18)
        starl1.textColor = UIColor.orangeColor()
        starl2.textColor = UIColor.orangeColor()
        
        starb.titleLabel!.font = UIFont(name: "Chalkboard SE", size: 15)
        starb.layer.cornerRadius = 8
        starb.layer.borderWidth = 2.0
        
        starb.layer.borderColor = UIColor.blueColor().CGColor
        
        
        starview.userInteractionEnabled = false
        starview.backgroundColor = UIColor.cyanColor()
        starview.layer.cornerRadius = 20
        starview.layer.shadowOffset = CGSizeMake(5, 5)
        starview.layer.shadowOpacity = 1.0
        starview.layer.shadowRadius = 5
        starview.layer.shadowColor = UIColor.blueColor().CGColor
        starview.hidden = true
        
        type1.font = UIFont(name: "Chalkboard SE", size: 19)
        text1.font = UIFont(name: "Chalkboard SE", size: 19)
        viewlist1.titleLabel!.font = UIFont(name: "Chalkboard SE", size: 15)
        viewlist1.layer.cornerRadius = 8
        viewlist1.layer.borderWidth = 2.0
        
        viewlist1.layer.borderColor = UIColor.blueColor().CGColor
        viewlist1.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
        viewlist1.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 0.7)
        viewlist1.layer.shadowOffset = CGSizeMake(5, 5)
        viewlist1.layer.shadowOpacity = 1.0
        viewlist1.layer.shadowRadius = 5
        viewlist1.layer.shadowColor = UIColor.blueColor().CGColor
        ok1.titleLabel!.font = UIFont(name: "Chalkboard SE", size: 17)
        ok1.layer.cornerRadius = 8
        ok1.layer.borderWidth = 2.0
        
        ok1.layer.borderColor = UIColor.blueColor().CGColor
        ok1.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
        ok1.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 0.7)
        ok1.layer.shadowOffset = CGSizeMake(5, 5)
        ok1.layer.shadowOpacity = 1.0
        ok1.layer.shadowRadius = 5
        ok1.layer.shadowColor = UIColor.blueColor().CGColor
        countall = wordlist.count
        progressbar.userInteractionEnabled = false
        progressbar.setProgress(Float(wordcount)/Float(countall), animated: false)
        
        viewlist1.hidden = true
        wrong1.userInteractionEnabled = false
        right1.userInteractionEnabled = false
        wrong1.hidden = true
        right1.hidden = true
        let listl = wordlist.count - 1
        for index in 0...listl {
            numlist.append(index)
        }
        let nc = UInt32(numlist.count)
        let nown = Int(arc4random_uniform(nc))
        at1 = numlist[nown]
        numlist.removeAtIndex(nown)
        word1.text = wordlist[at1][2]
        type1.text = wordlist[at1][1]
        text1.autocorrectionType = UITextAutocorrectionType.No
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.15, target: self, selector: Selector("Counting"), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func starout(sender: AnyObject) {
        starview.hidden = true
        starview.userInteractionEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func click1(sender: AnyObject) {
        ok1.hidden = true
        ok1.userInteractionEnabled = false
        if (equalornot(text1.text!, str2: wordlist[at1][0])) {
            right1.hidden = false
            waittime = 8
        } else {
            waittime = 17
            text1.text = ""
            wrong1.hidden = false
            var smalllist2:Array<String> = []
            for ix in 0...2 {
                smalllist2.append(wordlist[at1][ix])
            }
            smalllist2.append("\(at1)")
            wronglist.append(smalllist2)
            type1.text = wordlist[at1][0]
            type1.textColor = UIColor.blueColor()
            
        }
        currentTime = Int(timerCount)
        
    }
    
    func Counting() {
        timerCount = timerCount + 1
        
        if (currentTime > 0 && timerCount==currentTime+waittime) {
            
            getnew()
            
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    
    @IBAction func ShowWrongList(sender: AnyObject) {
    }
    func getnew() {
        wordcount = wordcount + 1
        progressbar.setProgress(Float(wordcount)/Float(countall), animated: false)
        
        if (numlist.count > 0) {
            type1.textColor = UIColor.blackColor()
            ok1.hidden = false
            right1.hidden = true
            wrong1.hidden = true
            let nc = UInt32(numlist.count)
            let nown = Int(arc4random_uniform(nc))
            at1 = numlist[nown]
            numlist.removeAtIndex(nown)
            word1.text = wordlist[at1][2]
            type1.text = wordlist[at1][1]
            text1.text = ""
            ok1.userInteractionEnabled = true
        } else {
            ok1.hidden = false
            ok1.setTitle("end of test", forState: .Normal)
            right1.hidden = true
            wrong1.hidden = true
            ok1.userInteractionEnabled = false
            text1.hidden = true
            if (Float(wordlist.count - wronglist.count)/Float(wordlist.count) > 0.8) {
                word1.text = "Congratulations!"
                if let tc = wrongl1.objectForKey("\(unitnum)t") as? Int {
                    if (tc < 3) {
                        if (wronglist.count == 0) {
                            starview.userInteractionEnabled = true
                            starview.hidden = false
                        } else if (wronglist.count == 1) {
                            starview.userInteractionEnabled = true
                            starl2.text = "99% in this test!"
                            starview.hidden = false
                        } else if (wronglist.count < 20) {
                            starview.userInteractionEnabled = true
                            starl2.text = "98% in this test!"
                            starview.hidden = false
                        }
                        wrongl1.setInteger(tc + 1, forKey: "\(unitnum)t")
                        wrongl1.synchronize()
                    }
                    
                } else {
                    if (wronglist.count == 0) {
                        starview.userInteractionEnabled = true
                        starview.hidden = false
                    } else if (wronglist.count == 1) {
                        starview.userInteractionEnabled = true
                        starl2.text = "99% in this test!"
                        starview.hidden = false
                    } else if (wronglist.count == 2) {
                        starview.userInteractionEnabled = true
                        starl2.text = "98% in this test!"
                        starview.hidden = false
                    }
                    wrongl1.setInteger(1, forKey: "\(unitnum)t")
                }

            } else if (Float(wordlist.count - wronglist.count)/Float(wordlist.count) > 0.5) {
                word1.text = "Good Job!"
            } else {
                word1.text = "Keep Going!"
            }
            
            word1.textColor = UIColor.magentaColor()
            type1.text = " You got \(wordlist.count - wronglist.count) out of \(wordlist.count) right"
            type1.textColor = UIColor.magentaColor()
            viewlist1.hidden = false
            wrongl1.setObject([(wordlist.count - wronglist.count),wordlist.count], forKey: keystring2)
            wrongl1.setObject(wronglist, forKey:keystring1)
            wrongl1.synchronize()
        }
        
        currentTime = 0
        
        

    }
    
    
    // compare the user input with the correct word
    func equalornot(str1: String, str2:String) -> Bool {
        let new1 = str1.lowercaseString
        let new2 = str2.lowercaseString
        //take spaces into account: for example, the correct word is "good morning" and the user typed in "  good   morning ", it counts as correct
        let s1 = new1.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        let s2 = new2.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        let list = s2.componentsSeparatedByString(" ")
        if (list.count > 1) {
            var correct_word:String = ""
            for str:String in list {
                correct_word = "\(correct_word)\(str)"
            }
            var newlist:Array<String> = []
            for str:String in (s1.componentsSeparatedByString(" ")) {
                if (str != "") {
                    newlist.append(str)
                }
            }
            var user_word:String = ""
            for str:String in newlist {
                user_word = "\(user_word)\(str)"
            }
            
            return list.count == newlist.count && user_word == correct_word
        } else {
            return s1==s2
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "ToWrongWordsFromTest") {
            let tableVC = segue.destinationViewController as! WrongWordTableView
            tableVC.words = wronglist
            tableVC.unitnum = unitnum
        }
    }
}
