////import UIKit
////
//////let char: Character = "a"
//////let code = char.unicodeScalars
//////let codeValue = code.first!.value
//////let newChar = Character(UnicodeScalar(codeValue + 1)!)
////
////class Cat {
////    //    static let species = "Feline"
////    func meow() {
////        print("meow")
////    }
////}
////
////class Person: Cat {
////    private(set)var name: String
////    fileprivate var age: Int
////
////    static let species = "Homo sapiens"
////    static func expandToMars() {
////        print("mars")
////    }
////
////    /// partial initializer, we have to call a full initializer
////    /// (convenience init)
////    convenience init(name: String) {
////        let titleName = "Mr. " + name
////        self.init(name: titleName, age: 10)
////    }
////
////    /// full initializers (designated init)
////    override init() {
////        /// name doesn't have value yet
////        name = "no name"
////        age = 0
////        /// setting name value has to be done
////    }
////
////    init(age: Int) {
////        self.age = age
////        self.name = "no name"
////    }
////
////    init(name: String, age: Int) {
////        self.name = name
////        self.age = age
////    }
////
////    func takeAWalk(distance: Int) {
////        for num in 0...distance {
////            print("\(name) is walking \(num)")
////        }
////    }
////
////    func takeAWalk(distance: Double) {
////        for num in 0...Int(distance) {
////            print("\(name) is walking \(num)")
////        }
////    }
////
////    func changeName(newName: String) {
////        self.name = newName
////    }
////
////}
////
////let noName = Person()
////noName.changeName(newName: "Bobby")
////
////print(noName.name)
////let tom = Person(name: "Tom")
////print(tom.name)
//////tom.name = "Timmy"
////print(tom.name)
////tom.takeAWalk(distance: 3)
////tom.takeAWalk(distance: 4.5)
////tom.age = 10
////
//////tom.location
////print(Person.species)
////
//////if type(of: tom) is Person.Type {
//////    print("tom is person")
//////}
////
////Person.expandToMars()
//////tom.expandToMars()
////type(of: tom).expandToMars()
////
////
////class Employee: Person {
////    var job: String
////
////    init(job: String, name: String) {
////        self.job = job
////        //        super.init()
////        super.init(name: name, age: 10)
////    }
////
////    override func takeAWalk(distance: Int) {
////        print("plumbers can't take a walk")
////    }
////
////    func fixSink() {
////        print("fixing")
////        restAfterWork()
////    }
////
////    private func restAfterWork() {
////        print("resting")
////    }
////
////    deinit {
////        print("removing form memory")
////    }
////}
////
////let timPlumber = Employee(job: "Plumbing", name: "Timothy")
////print(timPlumber.name)
////timPlumber.takeAWalk(distance: 10)
////timPlumber.fixSink()
//////plumber.restAfterWork()
//////tom.fixSink()
////
////let ericPlumber = Employee(job: "Plumbing", name: "Eric")
////print(ericPlumber.name)
////
////let plumberPlacerholder = ericPlumber
////plumberPlacerholder.changeName(newName: "Harry")
////print("new name:", plumberPlacerholder.name)
////print("old name:", ericPlumber.name)
////
////func changePlumberAge(plumber: Employee) {
////    plumber.age = 100
////}
////changePlumberAge(plumber: ericPlumber)
////print(ericPlumber.age)
////changePlumberAge(plumber: plumberPlacerholder)
////print(ericPlumber.age)
////
////func doSomething() {
////    let bobEmployee = Employee(job: "Driver", name: "Bob")
////    print("finishing doSomething function")
////}
////
////doSomething()
////
////class SemiHuman: Person {
////
////}
////let semiHuman = SemiHuman()
////semiHuman.meow()
////semiHuman.takeAWalk(distance: 2)
////
//
////
////  Company.swift
////  ClassAndStruct
////
////  Created by Luat on 5/24/21.
////
//
import Foundation
//
//enum Role {
//    case iOSDeveloper
//    case AndroidDeveloper
//    case QA
//    case Ux
//    case ProjectManager
//    case TechLead
//    case Architech
//    case FakeRole
//}
//
//enum PayRate {
//    case low
//    case normal
//    case high
//}
//
//import Foundation
//
//class Team {
//
//    var employees: [Employee] = []
//    var taskList: [Task] = []
//
//    func add(employee: Employee) {
//        self.employees.append(employee)
//    }
//
//    func add(task: Task) {
//        self.taskList.append(task)
//    }
//
//    func startWeek() {
//        for (index, _) in self.taskList.enumerated() {
//            validate(taskNum: index)
//        }
//    }
//
//    func validate(taskNum: Int) {
//        self.taskList[taskNum].setIsValid(status: true)
//    }
//
//    func assign(taskNum: Int, to employee: Employee) {
//        var taskToAssign = self.taskList[taskNum]
//        employee.attempt(task: &taskToAssign)
//    }
//
//    func allTasksCompleted() -> Bool {
//        var completed: [Bool] = []
//
//        for task in self.taskList {
//            if task.isComplete {
//                print("yes")
//                completed.append(true)
//            } else {
//                completed.append(false)
//            }
//        }
//        return completed.contains(false)
//    }
//
//    func weeksTillComplete() -> Int {
//        return 0
//    }
//
//    func printMoney() {
//    }
//
//}
//
//let fakeTeam = Team()
//
////
////  Employees.swift
////  ClassAndStruct
////
////  Created by Luat on 5/24/21.
////
//
//import Foundation
//
//class Employee {
//    var payRate: PayRate
//    var role: Role
//    var hoursWorked: Int = 0
//
//    init(role: Role, payRate: PayRate) {
//        self.role = role
//        self.payRate = payRate
//    }
//
//    func addToHoursWorked(hours: Int) {
//        self.hoursWorked += hours
//    }
//
//    func attempt(task: inout Task) {
//        let time = task.timeReq
//        let timeAvailable = 40 - self.hoursWorked
//        if time < timeAvailable {
//            self.addToHoursWorked(hours: time)
//            task.setTimeReq(timeLeft: 0)
//        } else {
//            let diff = time - timeAvailable
//            self.addToHoursWorked(hours: timeAvailable)
//            task.setTimeReq(timeLeft: diff)
//        }
//    }
//}
//
////
////  Task.swift
////  ClassAndStruct
////
////  Created by Luat on 5/24/21.
////
//
//import Foundation
//
//struct Task {
//
//    var timeReq: Int
//    let roleReq: Role
//    var isValid: Bool = false
//    var isComplete: Bool = false
//
//    mutating func setIsComplete(status: Bool) {
//        self.isComplete = status
//    }
//
//    mutating func setIsValid(status: Bool) {
//        self.isValid = status
//    }
//
//    mutating func setTimeReq(timeLeft: Int) {
//        self.timeReq = timeLeft
//    }
//}
//
//
//var task1 = Task(timeReq: 10, roleReq: .Architech)
//var task2 = Task(timeReq: 20, roleReq: .FakeRole)
//var task3 = Task(timeReq: 30, roleReq: .AndroidDeveloper)
//
//fakeTeam.add(task: task1)
//fakeTeam.add(task: task2)
//fakeTeam.add(task: task3)
//
//fakeTeam.validate(taskNum: 0)
//print(fakeTeam.taskList)
//
//for task in self.taskList {
employeesAvailable[task.roleReq] = self.employees.filter{$0.role == task.roleReq}
}
print(employeesAvailable)


var validEmployeeHoursWorked: [Role: Int] = [:]

for (key, value) in employeesAvailable {
if !value.isEmpty {
    var hours: Int = 0
    for e in value {
        hours += e.hoursWorked
    }
    validEmployeeHoursWorked[key] = hours
}
}

print(validEmployeeHoursWorked)

for (key, value) in validEmployeeHoursWorked {
for task in self.taskList {
    if task.roleReq == key {
        roleHoursRemaining[key] = task.timeReq - value
    }
}
}
print(roleHoursRemaining)

for (_, value) in roleHoursRemaining {
if value > 40 && value % 40 != 0 {
    weeksLeft += value/40 + 1

} else if value > 40 && value % 40 == 0 {
    weeksLeft += value/40
}
}
print(weeksLeft)
//


