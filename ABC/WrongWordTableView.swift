//
//  WrongWordTableView.swift
//  project12
//
//  Created by Sophia on 6/16/15.
//  Copyright (c) 2015 Sophia. All rights reserved.
//

import UIKit

class WrongWordTableView: UITableViewController {
    
    
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

        let cell = tableView.dequeueReusableCellWithIdentifier("Cell1", forIndexPath: indexPath) 

        cell.textLabel!.text = words[indexPath.row][0]
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "ToDetailFromWrong") {
            let detailView = segue.destinationViewController as! DetailViewController
            if let indexP = self.tableView.indexPathForCell(sender as! UITableViewCell) {
                var newarray:Array<String> = []
                for ix in 0...2 {
                    newarray.append(words[indexP.row][ix])
                }
                let intx:Int = Int(words[indexP.row][3])!
                detailView.int1 = intx
                detailView.array1 = newarray
            }
            detailView.unit = unitnum
        }
    }


}
