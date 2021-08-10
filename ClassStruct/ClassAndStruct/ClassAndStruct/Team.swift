//
//  Company.swift
//  ClassAndStruct
//
//  Created by Luat on 5/24/21.
//

import Foundation

class Team {
    
    var employees: [Employee] = []
    var taskList: [Task] = []
    
    func add(employee: Employee) {
        employees.append(employee)
    }
    
    func add(task: Task) {
        taskList.append(task)
    }
    
    func startWeek() {
        for index in 0..<taskList.count {
            validate(taskNum: index)
        }
    }
    
    func validate(taskNum: Int) {
        let task = taskList[taskNum]
        for employee in employees {
            if employee.role == task.roleReq {
                taskList[taskNum].isValid = true
                assign(taskNum: taskNum, to: employee)
                break
            } else {
                taskList[taskNum].isValid = false
            }
        }
    }
    
    func assign(taskNum: Int, to employee: Employee) {
        employee.attempt(task: &taskList[taskNum])
    }
    
    func allTasksCompleted() -> Bool {
        taskList.filter { $0.isComplete }.count == taskList.count
    }
    
    func weeksTillComplete() -> Int {
        var hoursTotal: [Role: Int] = [:]
        print(taskList)
        for task in taskList {
            if let hours = hoursTotal[task.roleReq] {
                hoursTotal[task.roleReq] = hours + task.timeReq
            } else {
                hoursTotal[task.roleReq] = task.timeReq
            }
        }
        print(hoursTotal)
        let hoursMax = hoursTotal.values.max() ?? 0
        let weeks = (Double(hoursMax) / 40).rounded(.up)
        print(hoursMax)
        print(weeks)
        return Int(weeks)
    }

    func printMoney() {
        print("BRRRRRRRRRRRRRRRRRRRRRR")
    }
    
}
