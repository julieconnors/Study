import UIKit

protocol MechanicProtocol {
    mutating func addNewVehicle(vehicle: Vehicle)
}

protocol Vehicle {
    var id: Int { get }
    var make: String { get }
    var inspectionPassed: Bool { get set }
    var isRepaired: Bool { get set }
    var inspection: InspectionType { get }
}

enum InspectionType {
    case brakes
    case acceleration
    case brakesAndAcceleration
}

class Car: Vehicle {
    var id: Int
    var make: String
    var inspectionPassed: Bool
    var isRepaired: Bool
    var inspection: InspectionType
    
    
    init(id: Int, make: String, inspectionPassed: Bool, isRepaired: Bool, inspection: InspectionType) {
        self.id = id
        self.make = make
        self.inspectionPassed = inspectionPassed
        self.isRepaired = isRepaired
        self.inspection = inspection
    }
}

class Customer {
    var myVehicle: Vehicle
    var myMechanic: Mechanic?
    
    init(myVehicle: Vehicle, myMechanic: Mechanic?) {
        self.myVehicle = myVehicle
        self.myMechanic = myMechanic
    }
    
    func sendVehicleForInspection() {
        if var mechanic = myMechanic {
            mechanic.addNewVehicle(vehicle: self.myVehicle)
        } else {
            print("no mechanic available")
        }
    }
}

struct Mechanic: MechanicProtocol {
    var inspectionList: [Vehicle]
    var repairList: [Vehicle]
    
    mutating func addNewVehicle(vehicle: Vehicle) {
        inspectionList.append(vehicle)
//        print(1)
        workOnInspections()
    }
    
    mutating func addVehicleToRepairList(vehicle: Vehicle) {
        repairList.append(vehicle)
//        print(4)
        workOnRepairs()
    }
    
    mutating func workOnInspections() {
        guard var vehicleToInspect = inspectionList.first else {
            fatalError("No more vehicles to inspect")
        }
//        print(2)
        inspectionList.removeFirst()
        inspectVehicle(vehicle: &vehicleToInspect)
    }
    
    mutating func workOnRepairs() {
        guard var vehicleToRepair = repairList.first else {
            fatalError("No more vehicles to repair")
        }
        repairList.removeFirst()
        repairVehicle(vehicle: &vehicleToRepair)
    }
    
    mutating func inspectVehicle(vehicle: inout Vehicle) {
        if vehicle.inspectionPassed == false && vehicle.isRepaired == false {
//            print(3)
            addVehicleToRepairList(vehicle: vehicle)
        } else if vehicle.isRepaired == true && vehicle.inspectionPassed == false {
            vehicle.inspectionPassed = true
//            print(6)
        }
    }

    mutating func repairVehicle(vehicle: inout Vehicle) {
//        print(5)
        vehicle.isRepaired = true
        inspectVehicle(vehicle: &vehicle)
    }
}

var myCar = Car(id: 224, make: "Toyota", inspectionPassed: false, isRepaired: false, inspection: .brakes)
var ed = Mechanic(inspectionList: [], repairList: [])
var me = Customer(myVehicle: myCar, myMechanic: ed)

print(me.myVehicle.inspectionPassed)
me.sendVehicleForInspection()

print(me.myVehicle.inspectionPassed)

