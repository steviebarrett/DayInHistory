//
//  EventTableViewCell.swift
//  DayInHistory
//
//  Created by Stephen Barrett on 14/06/2016.
//  Copyright © 2016 Stephen Barrett. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    var event: HistoryEvent? {
        didSet {
            updateCell()
        }
    }

    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var eventDescription: UILabel!

    func updateCell() {
        
        year.text = event?.year
        eventDescription.text = event?.text
    }
}
