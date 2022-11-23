//
//  DayTime.swift
//  PresentationsApp
//
//  Created by Alex A. Rocha on 17/11/22.
//

import Foundation

struct DayTime {
    
    var hour: Int
    var minute: Int
    var second: Int
    
    init(hour: Int, minute: Int, second: Int) {
        self.hour = hour
        self.minute = minute
        self.second = second
    }
    
    init() {
        self.hour = 0
        self.minute = 0
        self.second = 0
    }
    
}
