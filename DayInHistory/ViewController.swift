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
        api.loadData("http://history.muffinlabs.com/date", completion: didLoadData)
    }
    
    func didLoadData(events: [HistoryEvent]) {
        
        for item in events {
            print("\(item.year) : \(item.text)\n")
        }
    }        
}


