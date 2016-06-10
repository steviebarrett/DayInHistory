//
//  DayInHistory.swift
//  DayInHistory
//
//  Created by Stephen Barrett on 10/06/2016.
//  Copyright © 2016 Stephen Barrett. All rights reserved.
//

import Foundation

class HistoryEvent {
    
    //MARK: class variables
    private var _year:String
    private var _text:String
    
    //MARK: getters
    var year:String {
        return _year
    }
    
    var text:String {
        return _text
    }
    
    //MARK: Initializer
    init(data: JSONDictionary) {
        
        //Event Year
        if let year = data["year"] as? String {
            self._year = year
        } else {
            _year = ""
        }
        
        if let text = data["text"] as? String {
            self._text = text
        } else {
            _text = ""
        }
    }
}