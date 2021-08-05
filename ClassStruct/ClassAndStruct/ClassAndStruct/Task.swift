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
    var isValid: Bool = true
    var isComplete: Bool = true
    
    func setIsComplete(status: Bool) {
    }
    
    func setIsValid(status: Bool) {
    }
    
    func setTimeReq(timeLeft: Int) {
    }
}
