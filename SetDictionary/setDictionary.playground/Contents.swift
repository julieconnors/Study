//import UIKit
//
//// MARK: - Set
//
//let arr = [1, 1, 2, 3, 4]
////print(arr[0])
//
//var mySet: Set<Int> = [1,1,2,3,4]
//var myEmptySet: Set<Int> = []
////print(mySet.first)
//var myTenSet: Set<Int> = [1, 10,11,12]
//print("count: ", mySet.count)
//
//for ele in mySet {
//    print(ele)
//}
//mySet.union(myTenSet)
//mySet.intersection(myTenSet)
//mySet.subtract(myTenSet)
//
//// MARK: - Dictionary
//
//var counter: [Int: Int] = [:]
//
//for num in 3...6 {
//    counter[num] = num + 10
//}
//
//let zeroValue = counter[5]
//if let zeroValue = zeroValue {
//    print("zeroValue:", zeroValue)
//}
//
//print(counter.keys)
//print(counter.values)
//for element in counter {
//    print("element.0:", element.0, "elment.1:", element.1)
//}
//
//for (key, value) in counter {
//    print("key:", key, "value:", value)
//}
//
//let nums = [1,1,2,4]
//var numCounter: [Int: Int] = [:]
//for num in nums {
////    numCounter[num] += 1
//    if let count = numCounter[num] {
//        numCounter[num] = count + 1
//    } else {
//        numCounter[num] = 1
//    }
//}
//print(numCounter)
//
//// MARK: - Optionals
//
//let firstEle = mySet.first
///// 1. Force Unwrap (worst method but fastest)
//print("Forced Unwrapped", firstEle!)
//
///// 2. Optional binding (safe way)
//if let num = firstEle {
//    print(num, "first ele has value")
//} else {
//    print("first ele is nil")
//}
//
//guard let num = firstEle else {
//   fatalError("prevent execution from moving on")
//}
//print("Optional Binding:", num)
//
///// 3. Nil coalescing (convenient)
//print(firstEle ?? 0)
//
//let strSet: Set<String> = []
//let firstStr = strSet.first
//print("First String:", firstStr ?? "No string here")
//
///// 4. Optional Chaining (doesn't actually unwrap)
//class Person {
//    let name: String
//    let location: Location?
//    init(name: String, location: Location?) {
//        self.name = name
//        self.location = location
//    }
//
//}
//struct Location {
//    let address: String
//}
//let myLoc = Location(address: "Philly")
//let optLuke: Person? = Person(name: "luke", location: myLoc)
//let name = optLuke?.name
//let address = optLuke?.location?.address
//
//if let person = optLuke {
//    if let location = person.location {
//        let address = location.address
//        print(address)
//    }
//}
//
//print(name)
//if let name = name {
//    print("name exists:", name)
//}
//
///// 5. Implicitly unwrapped (implied force unwrapped)
//
//let optString: String! = "opt Str"
//print("opt string:", optString)
//let myNewStr: String = optString
//print("my new str:", myNewStr)
//

/**
 Using Dictionary:
 Input: array of integers: [1, 4, 8, 1] with 1 having the highest priority.
 Output: reduce the distance bettwen priorities but keep the same priority ordering
 [1, 4, 8, 1] -> [1, 2, 3, 1]
 */
func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
    let sorted = array.sorted()
    let max = array.max() ?? 0

    var priorities: [Int] = Array(repeating: -1, count: max + 1)
    var priority = 0
    for num in sorted {
        if priorities[num] == -1 {
            priority += 1
        }
            //Index: 0   1   2   3  4   5   6   7  8
                // [-1,  1, -1, -1, 2, -1, -1, -1, 3]
        priorities[num] = priority
    }
    
    var result: [Int] = []
    for num in array {
        let newPriority = priorities[num]
            result.append(newPriority)
        }
    
    return result
}

let input = [1, 4, 8, 1]

let inputTwo = [8, 6, 2, 4]
//let expectedTwo = [4, 3, 1, 2]

reduceDistanceKeepPriority(array: inputTwo)

    
//let sorted = array.sorted()
//let max = array.max() ?? 0
//
//var priorities: [Int] = Array(repeating: -1, count: max + 1)
//var priority = 0
//for num in sorted {
//    if priorities[num] == -1 {
//        priority += 1
//    }
//        //Index: 0   1   2   3  4   5   6   7  8
//            // [-1,  1, -1, -1, 2, -1, -1, -1, 3]
//    priorities[num] = priority
//}
//
//var result: [Int] = []
//for num in array {
//    let newPriority = priorities[num]
//        result.append(newPriority)
//    }
//
//return result
