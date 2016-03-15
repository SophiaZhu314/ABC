//
//  LearnView.swift
//  project12
//
//  Created by Sophia on 6/14/15.
//  Copyright (c) 2015 Sophia. All rights reserved.
//

import UIKit
import AVFoundation

class LearnView: UIViewController {
    
    @IBOutlet weak var indexlabel1: UILabel!
    @IBOutlet weak var progressbar1: UIProgressView!
    @IBOutlet weak var addlist1: UIButton!
    @IBOutlet weak var word1: UILabel!
    @IBOutlet weak var type1: UILabel!
    @IBOutlet weak var translation1: UILabel!
    @IBOutlet weak var viewlist: UIButton!
    @IBOutlet weak var p1: UIButton!
    @IBOutlet weak var n1: UIButton!
    @IBOutlet weak var s1: UIButton!

    @IBOutlet weak var starview: UIView!
    @IBOutlet weak var starl1: UILabel!
    
    @IBOutlet weak var starb: UIButton!
    @IBOutlet weak var starl2: UILabel!

    var list:Array<Array<String>>!
    var keystring:String!

    var audio1:AVAudioPlayer!
    var clicked:Bool = false
    var oldlist = NSUserDefaults()
    var numlist:Array<Int>!
    var at1 = 0
    var unitnum:String!
    var audioprefix:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        getaudio("1-a series of")

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
        word1.font = UIFont(name: "Chalkboard SE", size: 24)
        type1.font = UIFont(name: "Chalkboard SE", size: 19)
        indexlabel1.font = UIFont(name: "Chalkboard SE", size: 16)
        addlist1.titleLabel!.font = UIFont(name: "Chalkboard SE", size: 19)
        addlist1.layer.cornerRadius = 8
        addlist1.layer.borderWidth = 2.0
        
        addlist1.layer.borderColor = UIColor.blueColor().CGColor
        addlist1.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
        addlist1.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 0.7)
        addlist1.layer.shadowOffset = CGSizeMake(5, 5)
        addlist1.layer.shadowOpacity = 1.0
        addlist1.layer.shadowRadius = 5
        addlist1.layer.shadowColor = UIColor.blueColor().CGColor
        s1.layer.shadowOffset = CGSizeMake(5, 5)
        s1.layer.shadowOpacity = 1.0
        s1.layer.shadowRadius = 5
        s1.layer.shadowColor = UIColor.blueColor().CGColor
        p1.layer.shadowOffset = CGSizeMake(5, 5)
        p1.layer.shadowOpacity = 1.0
        p1.layer.shadowRadius = 5
        p1.layer.shadowColor = UIColor.blueColor().CGColor
        n1.layer.shadowOffset = CGSizeMake(5, 5)
        n1.layer.shadowOpacity = 1.0
        n1.layer.shadowRadius = 5
        n1.layer.shadowColor = UIColor.blueColor().CGColor
        viewlist.titleLabel!.font = UIFont(name: "Chalkboard SE", size: 19)
        viewlist.layer.cornerRadius = 8
        viewlist.layer.borderWidth = 2.0
        
        viewlist.layer.borderColor = UIColor.blueColor().CGColor
        viewlist.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
        viewlist.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 0.7)
        viewlist.layer.shadowOffset = CGSizeMake(5, 5)
        viewlist.layer.shadowOpacity = 1.0
        viewlist.layer.shadowRadius = 5
        viewlist.layer.shadowColor = UIColor.blueColor().CGColor
        oldlist = NSUserDefaults.standardUserDefaults()
        if (unitnum == "unit1") {
            keystring = "custom1"
            audioprefix = "1-"
        } else if (unitnum == "unit2") {
            keystring = "custom2"
            audioprefix = "2-"
        } else if (unitnum == "unit3") {
            keystring = "custom3"
            audioprefix = "3-"
        } else if (unitnum == "unit4") {
            keystring = "custom4"
            audioprefix = "4-"
        } else if (unitnum == "unit5") {
            keystring = "custom5"
            audioprefix = "5-"
        }
        if let numlist1 = oldlist.arrayForKey(keystring) {
            
            numlist = numlist1 as! Array<Int>
        } else {
            numlist = []
        }
        
        word1.text = list[at1][0]
        var audioname:String = audioprefix + list[at1][0]
        audioname = audioname.stringByReplacingOccurrencesOfString("(", withString: "")
        audioname = audioname.stringByReplacingOccurrencesOfString(")", withString: "")
        audioname = audioname.stringByReplacingOccurrencesOfString("'", withString: "")
        audioname = audioname.stringByReplacingOccurrencesOfString("/", withString: "Z")
        audioname = audioname.stringByReplacingOccurrencesOfString(" ... ", withString: "...")
        
        
        getaudio(audioname)

        
        
        type1.text = list[at1][1]
        translation1.text = list[at1][2]

        if (numlist.contains(at1)) {
            addlist1.setTitle("Added", forState: .Normal)
            addlist1.userInteractionEnabled = false
        }
        progressbar1.userInteractionEnabled = false
        progressbar1.setProgress(Float(at1+1)/Float(list.count), animated: false)
        indexlabel1.text = "\(at1+1) out of \(list.count)"

    }
    
    func getaudio(name:String){
        do {
            try audio1 = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(name, ofType: "mp3")!))
        } catch {
            print("can not find audio")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func Sound1(sender: AnyObject) {
        
        audio1.play()
    }
    
    //change button text after added the word into the list
    @IBAction func AddtoList(sender: AnyObject) {
        if (numlist.contains(at1)) {
            
        } else {
            addlist1.userInteractionEnabled = false
            numlist.append(at1)
            
            oldlist.setObject(numlist, forKey:keystring)
            oldlist.synchronize()
            addlist1.setTitle("Added", forState: .Normal)
            
        }
        
        
    }
    
    @IBAction func ShowCustomList(sender: AnyObject) {

    }
    
    @IBAction func starout(sender: AnyObject) {
        starview.hidden = true
        starview.userInteractionEnabled = false
    }

    @IBAction func PreviousWord1(sender: AnyObject) {
        
        if (at1 > 0) {
            addlist1.userInteractionEnabled = false
            at1 = at1 - 1
            if (numlist.contains(at1)) {
                
                addlist1.setTitle("Added", forState: .Normal)
                word1.text = list[at1][0]
                var audioname:String = audioprefix + list[at1][0]
                audioname = audioname.stringByReplacingOccurrencesOfString("(", withString: "")
                audioname = audioname.stringByReplacingOccurrencesOfString(")", withString: "")
                audioname = audioname.stringByReplacingOccurrencesOfString("'", withString: "")
                audioname = audioname.stringByReplacingOccurrencesOfString("/", withString: "Z")
                audioname = audioname.stringByReplacingOccurrencesOfString(" ... ", withString: "...")
                getaudio(audioname)
                type1.text = list[at1][1]
                translation1.text = list[at1][2]
            } else {
                addlist1.setTitle("Add to Saved List", forState: .Normal)
                addlist1.userInteractionEnabled = true
                word1.text = list[at1][0]
                var audioname:String = audioprefix + list[at1][0]
                audioname = audioname.stringByReplacingOccurrencesOfString("(", withString: "")
                audioname = audioname.stringByReplacingOccurrencesOfString(")", withString: "")
                audioname = audioname.stringByReplacingOccurrencesOfString("'", withString: "")
                audioname = audioname.stringByReplacingOccurrencesOfString("/", withString: "Z")
                audioname = audioname.stringByReplacingOccurrencesOfString(" ... ", withString: "...")
                getaudio(audioname)
                type1.text = list[at1][1]
                translation1.text = list[at1][2]
            }
            progressbar1.setProgress(Float(at1+1)/Float(list.count), animated: false)
            indexlabel1.text = "\(at1+1) out of \(list.count)"
            
        }
    }
    
    
    @IBAction func NextWord1(sender: AnyObject) {
        
        if (at1 < list.count - 1) {
            addlist1.userInteractionEnabled = false
            at1 = at1 + 1
            if (numlist.contains(at1)) {
                
                addlist1.setTitle("Added", forState: .Normal)
                word1.text = list[at1][0]
                var audioname:String = audioprefix + list[at1][0]
                audioname = audioname.stringByReplacingOccurrencesOfString("(", withString: "")
                audioname = audioname.stringByReplacingOccurrencesOfString(")", withString: "")
                audioname = audioname.stringByReplacingOccurrencesOfString("'", withString: "")
                audioname = audioname.stringByReplacingOccurrencesOfString("/", withString: "Z")
                audioname = audioname.stringByReplacingOccurrencesOfString(" ... ", withString: "...")
                getaudio(audioname)
                type1.text = list[at1][1]
                translation1.text = list[at1][2]
                
            } else {
                addlist1.setTitle("Add to Saved List", forState: .Normal)
                addlist1.userInteractionEnabled = true
                word1.text = list[at1][0]
                var audioname:String = audioprefix + list[at1][0]
                audioname = audioname.stringByReplacingOccurrencesOfString("(", withString: "")
                audioname = audioname.stringByReplacingOccurrencesOfString(")", withString: "")
                audioname = audioname.stringByReplacingOccurrencesOfString("'", withString: "")
                audioname = audioname.stringByReplacingOccurrencesOfString("/", withString: "Z")
                audioname = audioname.stringByReplacingOccurrencesOfString(" ... ", withString: "...")
                getaudio(audioname)
                type1.text = list[at1][1]
                translation1.text = list[at1][2]
            }
            progressbar1.setProgress(Float(at1+1)/Float(list.count), animated: false)
            indexlabel1.text = "\(at1+1) out of \(list.count)"
            if (at1 == list.count - 1) {
                let completed = "\(unitnum)c"
                if let com = oldlist.objectForKey(completed) as? Int {
                    if (com == 0) {
                        starview.hidden = false
                        starview.userInteractionEnabled = true
                        oldlist.setInteger(1, forKey: completed)
                        oldlist.synchronize()
                    }
                } else {
                    starview.hidden = false
                    starview.userInteractionEnabled = true
                    oldlist.setInteger(1, forKey: completed)
                    oldlist.synchronize()
                }                
            }
        }
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ToCustomListFromLearn") {
            clicked = true
            let tableVC = segue.destinationViewController as! CustomListTableView
            tableVC.wordindex = numlist
            tableVC.words = list
            tableVC.unit = unitnum
            
            
        }
    }
    override func viewWillAppear(animated: Bool) {
        
        if (clicked) {
            oldlist.synchronize()
            if let somelist = oldlist.arrayForKey(keystring) {
                numlist = somelist as! Array<Int>
            }
            if (numlist.contains(at1)) {
                addlist1.setTitle("Added", forState: .Normal)
                addlist1.userInteractionEnabled = false
            } else {
                addlist1.setTitle("Add to Saved List", forState: .Normal)
                addlist1.userInteractionEnabled = true
            }            
        }

    }
    
}
