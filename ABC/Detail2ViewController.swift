//
//  Detail2ViewController.swift
//  project12
//
//  Created by Sophia on 6/18/15.
//  Copyright (c) 2015 Sophia. All rights reserved.
//

import UIKit
import AVFoundation

class Detail2ViewController: UIViewController {
    
    var array1:Array<String>!
    var unit:String!
    var audio1 : AVAudioPlayer!
    var audioname:String!
    
    @IBOutlet weak var word1: UILabel!
    @IBOutlet weak var type1: UILabel!
    @IBOutlet weak var t1: UILabel!
    @IBOutlet weak var s1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        getaudio("1-a series of")
        s1.layer.shadowOffset = CGSizeMake(5, 5)
        s1.layer.shadowOpacity = 1.0
        s1.layer.shadowRadius = 5
        s1.layer.shadowColor = UIColor.blueColor().CGColor
        word1.font = UIFont(name: "Chalkboard SE", size: 24)
        type1.font = UIFont(name: "Chalkboard SE", size: 19)
        word1.text = array1[0]
        if (unit == "unit1") {
            audioname = "1-" + array1[0]

        } else if (unit == "unit2") {
            audioname = "2-" + array1[0]

        } else if (unit == "unit3") {
            audioname = "3-" + array1[0]
        } else if (unit == "unit4") {
            audioname = "4-" + array1[0]
            
        } else if (unit == "unit5") {
            audioname = "5-" + array1[0]
        }
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
}
