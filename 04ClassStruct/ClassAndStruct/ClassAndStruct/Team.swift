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
        self.employees.append(employee)
    }
    
    func add(task: Task) {
        self.taskList.append(task)
    }
    
    func startWeek() {
        for (index, _) in self.taskList.enumerated() {
            employees.append(employee)
        }
    }
    
    func add(task: Task) {
        taskList.append(task)
    }
    
//    func startWeek() {
//        for index in 0..<taskList.count {
//            validate(taskNum: index)
//        }
//    }
    
    func validate(taskNum: Int) {
        let taskToValidate = self.taskList[taskNum]
        var validEmployees: [Employee] = []
        for employee in self.employees{
            if employee.role == taskToValidate.roleReq {
                self.taskList[taskNum].setIsValid(status: true)
                validEmployees.append(employee)
            }
        }
        if validEmployees.count > 0 {
            assign(taskNum: taskNum, to: validEmployees[0])
        }
//        let task = taskList[taskNum]
//        for employee in employees {
//            if employee.role == task.roleReq {
//                taskList[taskNum].isValid = true
//                assign(taskNum: taskNum, to: employee)
//                break
//            } else {
//                taskList[taskNum].isValid = false
//            }
//        }
    }
    
    func assign(taskNum: Int, to employee: Employee) {
        employee.attempt(task: &taskList[taskNum])
    }
    
    func allTasksCompleted() -> Bool {
        for task in taskList {
            if !task.isComplete {
                return false
            }
        }
        return true
//        taskList.filter { $0.isComplete }.count == taskList.count
    }
    
    func weeksTillComplete() -> Int {
        var hoursTotal: [Role: Int] = [:]

        for task in taskList {
            if let hours = hoursTotal[task.roleReq] {
                hoursTotal[task.roleReq] = hours + task.timeReq
            } else {
                hoursTotal[task.roleReq] = task.timeReq

                }
            }
        
        let hoursMax = hoursTotal.values.max() ?? 0
        let weeks = (Double(hoursMax) / 40).rounded(.up)
      
        return Int(weeks)
    }
    
    
//    my weeksTillComplete
    
//        var validTasks: [Task] = []
//        var employeesAvailable: [Role: [Employee]] = [:]
//        var validEmployeeHoursWorked: [Role: Int] = [:]
//        var weeksLeft: Int = 0
//1. check if week has started (if any tasks are invalid)
//2. check for valid tasks (make an array of valid tasks)
//3. make a dictionary of employees whose role matches valid task role
//4. count employee hours worked
//5. count task hours required for each valid task
//6. calculate weeks of work remaining depending on task timeReq and employee hoursWorked in a 40 hour week
    
///1.
//        for task in self.taskList {
//            if task.isValid {
//                validTasks.append(task)
//            }
//        }
    
///2.
//        if validTasks.isEmpty {
//            weeksLeft = 1
//            self.startWeek()
//        }
    
///3.
//        var totalTaskTime: Int = 0
//        for task in validTasks {
//            employeesAvailable[task.roleReq] = self.employees.filter{$0.role == task.roleReq}
//            totalTaskTime += task.timeReq
//            }
//        print("employees", employeesAvailable)
//        print("total task time", totalTaskTime)
//        for (_, value) in employeesAvailable {
//
//            totalTaskTime /= value
//        }
    
///4.
//        for (key, value) in employeesAvailable {
//            print(key, value)
//            var hours: Int = 0
//            for e in value {
//                hours += e.hoursWorked
//                validEmployeeHoursWorked[key] = hours
//            }
//        }
    
//        print("employee hours worked", validEmployeeHoursWorked)
//        var roleHoursRemaining: [Role: Int] = [:]
    
///5.
//        for (key, value) in validEmployeeHoursWorked {
//
//            for task in validTasks {
//                if task.roleReq == key {
//                    roleHoursRemaining[key] = abs(task.timeReq - value)
//                }
//            }
//        }
//        print(roleHoursRemaining)
    
///6.
//        for (_, value) in roleHoursRemaining {
//            if value > 40 && value % 40 != 0 {
//                weeksLeft += value/40 + 1
//            } else if value > 40 && value % 40 == 0 {
//                weeksLeft += value/40
//            }
//        }
//
//        print("weeks left", weeksLeft)
//        return weeksLeft

    func printMoney() {
        if allTasksCompleted(){
            print("BRRRRRRRRRRRRRRRRRRRRRRRRRRRRR")
        }
    }
}
