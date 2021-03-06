//
//  ViewController.swift
//  DayInHistory
//
//  Created by Stephen Barrett on 10/06/2016.
//  Copyright © 2016 Stephen Barrett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var events = [HistoryEvent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Call API
        let api = APIManager()
        let eventTypes : [String] = ["event", "birth", "death"]
        
        for eType in eventTypes {
            api.loadData("http://history.muffinlabs.com/date", eventType:eType, completion: didLoadData)
        }
    }
    
    func didLoadData(events: [HistoryEvent], eventType:String) {
        
        print(eventType + "\n\n")
        for item in events {
            print("\(item.year) : \(item.text)\n")
        }
    }        
}


