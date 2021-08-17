//
//  Task.swift
//  ClassAndStruct
//
//  Created by Luat on 5/24/21.
//

import Foundation

struct Task {

    var timeReq: Int
    let roleReq: Role
    var isValid: Bool = false
    var isComplete: Bool = false
    
    mutating func setIsComplete(status: Bool) {
        isComplete = status
    }
    
    mutating func setIsValid(status: Bool) {
        isValid = status
    }
    
    mutating func setTimeReq(timeLeft: Int) {
        timeReq = timeLeft
    }
}
