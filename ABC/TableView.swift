//
//  TableView.swift
//  project12
//
//  Created by Sophia on 6/15/15.
//  Copyright (c) 2015 Sophia. All rights reserved.
//

import UIKit

class TableView: UITableViewController {
    
    var words:Array<Array<String>>!
    var unitnum:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MainCell", forIndexPath: indexPath) 
        
        cell.textLabel!.text = words[indexPath.row][0]
        cell.detailTextLabel!.text = words[indexPath.row][2]
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "ToDetailFromComplete") {
            let detailView = segue.destinationViewController as! DetailViewController
            if let indexP = self.tableView.indexPathForCell(sender as! UITableViewCell) {
                detailView.int1 = indexP.row
                detailView.array1 = words[indexP.row]
            }
            detailView.unit = unitnum
        }
    }

}
