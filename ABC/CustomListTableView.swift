//
//  CustomListTableView.swift
//  project12
//
//  Created by Sophia on 6/17/15.
//  Copyright (c) 2015 Sophia. All rights reserved.
//

import UIKit

class CustomListTableView: UITableViewController {
    
    var words:Array<Array<String>>!
    var indexes = NSUserDefaults()
    var wordindex:Array<Int>!
    var unit:String!
    var keystring:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indexes = NSUserDefaults.standardUserDefaults()
        if (unit == "unit1") {
            keystring = "custom1"
        } else if (unit == "unit2") {
            keystring = "custom2"
        } else if (unit == "unit3") {
            keystring = "custom3"
        } else if (unit == "unit4") {
            keystring = "custom4"
        } else if (unit == "unit5") {
            keystring = "custom5"
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return wordindex.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Celll", forIndexPath: indexPath) 
        
        cell.textLabel!.text = words[wordindex[indexPath.row]][0]
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            wordindex.removeAtIndex(indexPath.row)
            indexes.setObject(wordindex, forKey: keystring)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ToDetailFromCustomTable") {
            let detailView = segue.destinationViewController as! Detail2ViewController
            if let indexP = self.tableView.indexPathForCell(sender as! UITableViewCell) {
                detailView.array1 = words[wordindex[indexP.row]]
            }
            detailView.unit = unit
        }
    }
    

}
