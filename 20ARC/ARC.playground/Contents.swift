import UIKit

var greeting = "Hello, playground"


class Vehicle {
    static let numTires = 4
    
    var engine: Engine?
    
    init(engine: Engine?) {
        self.engine = engine
    }
    
    deinit {
        print("memory is reclaimed")
    }
}

class Engine {
    weak var vehicle: Vehicle?
}

//func doSomething() {
//    print("start of do something")
//    let localVar = 5
//    let engine = Engine()
//    let vehicle = Vehicle(engine: engine)
//    engine.vehicle = vehicle
//    // do something
//    // exit the scope
//}
//
//doSomething()

/// ARC: automatic reference couting (only reference types)
/// classes and closure


/// Strong reference cycle
var engine: Engine? = Engine()

var vehicleOne: Vehicle? = Vehicle(engine: engine)

engine?.vehicle = vehicleOne

vehicleOne = nil
engine = nil


print("end")
