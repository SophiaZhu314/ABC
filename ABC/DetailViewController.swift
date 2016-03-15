//
//  DetailViewController.swift
//  project12
//
//  Created by Sophia on 6/17/15.
//  Copyright (c) 2015 Sophia. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {
    
    @IBOutlet weak var word1: UILabel!
    @IBOutlet weak var type1: UILabel!
    @IBOutlet weak var t1: UILabel!
    @IBOutlet weak var addbutton: UIButton!
    @IBOutlet weak var s1: UIButton!
    
    var array1:Array<String>!
    var int1:Int!
    var custom1 = NSUserDefaults()
    var isthere = false
    var indexlist:Array<Int>!
    var unit:String!
    var keystring:String!
    var audio1 : AVAudioPlayer!
    var audioprefix:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        getaudio("1-a series of")
        s1.layer.shadowOffset = CGSizeMake(5, 5)
        s1.layer.shadowOpacity = 1.0
        s1.layer.shadowRadius = 5
        s1.layer.shadowColor = UIColor.blueColor().CGColor
        word1.font = UIFont(name: "Chalkboard SE", size: 24)
        type1.font = UIFont(name: "Chalkboard SE", size: 19)
        addbutton.titleLabel!.font = UIFont(name: "Chalkboard SE", size: 21)
        addbutton.layer.cornerRadius = 8
        addbutton.layer.borderWidth = 2.0
        
        addbutton.layer.borderColor = UIColor.blueColor().CGColor
        addbutton.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
        addbutton.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 0.7)
        addbutton.layer.shadowOffset = CGSizeMake(5, 5)
        addbutton.layer.shadowOpacity = 1.0
        addbutton.layer.shadowRadius = 5
        addbutton.layer.shadowColor = UIColor.blueColor().CGColor
        custom1 = NSUserDefaults.standardUserDefaults()
        if (unit == "unit1") {
            keystring = "custom1"
            audioprefix = "1-"
        } else if (unit == "unit2") {
            keystring = "custom2"
            audioprefix = "2-"
        } else if (unit == "unit3") {
            keystring = "custom3"
            audioprefix = "3-"
        } else if (unit == "unit4") {
            keystring = "custom4"
            audioprefix = "4-"
        } else if (unit == "unit5") {
            keystring = "custom5"
            audioprefix = "5-"
        }
        if let list = custom1.arrayForKey(keystring) {
            indexlist = list as! Array<Int>
            if (indexlist.contains(int1)) {
                isthere = true
                addbutton.setTitle("Added", forState: .Normal)
                addbutton.userInteractionEnabled = false
            } else {
                isthere = false
                addbutton.setTitle("Add to Saved List", forState: .Normal)
                addbutton.userInteractionEnabled = true
            }
        } else {
            indexlist = []
            isthere = false
            addbutton.setTitle("Add to Saved List", forState: .Normal)
            addbutton.userInteractionEnabled = true
        }
        word1.text = array1[0]
        var audioname:String = audioprefix + array1[0]

        audioname = audioname.stringByReplacingOccurrencesOfString("(", withString: "")
        audioname = audioname.stringByReplacingOccurrencesOfString(")", withString: "")
        audioname = audioname.stringByReplacingOccurrencesOfString("'", withString: "")
        audioname = audioname.stringByReplacingOccurrencesOfString("/", withString: "Z")
        audioname = audioname.stringByReplacingOccurrencesOfString(" ... ", withString: "...")
        
        
        getaudio(audioname)
        type1.text = array1[1]
        t1.text = array1[2]
        
    }
    
    func getaudio(name:String){
        do {
            try audio1 = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(name, ofType: "mp3")!))
        } catch {
            print("can not find audio")
        }
        
    }
    
    @IBAction func sound1(sender: AnyObject) {
        audio1.play()
    }

    @IBAction func add1(sender: AnyObject) {
        if (!isthere) {
            isthere = true
            indexlist.append(int1)
            custom1.setObject(indexlist, forKey: keystring)
            custom1.synchronize()
            addbutton.setTitle("Added", forState: .Normal)
            addbutton.userInteractionEnabled = false
        }
    }

}
