//
//  EventTableViewController.swift
//  DayInHistory
//
//  Created by Stephen Barrett on 14/06/2016.
//  Copyright © 2016 Stephen Barrett. All rights reserved.
//

import UIKit

class EventTableViewController: UITableViewController {
    
    var events = [HistoryEvent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Call API
        let api = APIManager()
        
        //        let eventTypes : [String] = ["event", "birth", "death"]
        let eventTypes : [String] = ["event"]
        
        for eType in eventTypes {
            api.loadData("http://history.muffinlabs.com/date", eventType:eType, completion: didLoadData)
        }
    }
    
    func didLoadData(events: [HistoryEvent], eventType:String) {
        
        self.events = events
        
        print("\n" + eventType + "s\n")
        for item in events {
            print("\(item.year) : \(item.text)\n")
        }
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return events.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        let event = events[indexPath.row]
        
        cell.textLabel?.text = (event.year)
        cell.detailTextLabel?.text = event.text
        cell.detailTextLabel?.sizeToFit()

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
