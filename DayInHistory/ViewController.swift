//
//  ViewController.swift
//  DayInHistory
//
//  Created by Stephen Barrett on 10/06/2016.
//  Copyright © 2016 Stephen Barrett. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
 
    var events = [HistoryEvent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 88.0 // Whatever it is in Interface Builder
        tableView.rowHeight = UITableViewAutomaticDimension
        
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
    
    //TableView methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return events.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let event = events[indexPath.row]
        
        cell.textLabel?.text = (event.year)
        cell.detailTextLabel?.text = event.text
        cell.detailTextLabel?.sizeToFit()
        
        return cell
    }
}


