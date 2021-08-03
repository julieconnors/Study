//import UIKit
//
//var greeting = "Hello, playground"
//
//
//func testing() {
//    let moneyLeft = 2
//
//    if moneyLeft > 5 {
//
//    } else {
//
//    }
//    print("after if statment")
//
//    guard moneyLeft > 5 else {
//        return print("outta money")
//    }
//
//    print("after guard statment")
//}
//testing()
//
//let moneyLeft = 2
//
//moneyLeft > 5 ? print("greater 5") : print("lesser 5")
//
//let myInt: Int = 9
//let myInt8: Int8 = 100
//let myInt32: Int32 = 100
//let myInt64: Int64 = 100
//let uSign: UInt8 = 255
//print(uSign)
//print("int8 max", Int8.max)
//print("int16 max", Int16.max)
//
//
//let doub: Double = 10.0
//let float: Float = 10.0
//
//let xPostion: CGFloat = 10.0
//
//var genArr: [Any] = [1, "adf", []]
//var intArr = [1,2,3,4]
////intArr.append(5)
////intArr.append("5")   /// Can't do this
//
//let firstInt = intArr[0]
//let firstGen = genArr[0]
//let castedGen = firstGen as! Int
//
//for ele in genArr {
//    print(ele)
//}
//
//for (index, ele) in intArr.enumerated() {
//    print(index, ele)
//}
//
//let mappedArr = intArr.map { element in
//    return element + 10
//}
//print(mappedArr)
//print(intArr)
//
//let filteredArr = intArr.filter { element in
//    return element % 2 == 0
//}
//print(filteredArr)
//
//let reduced = intArr.reduce(1) { total, element in
//    return total * element
//}
//print(reduced)


/**
    10. Input: array of integers: [1, 4, 8, 4] with 1 having the highest priority.
    Output: reduce the distance bettwen priorities but keep the same priority ordering
    [1, 4, 8, 4] -> [1, 2, 3, 2]
 */
func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
    
    var reduced: [Int] = [1]

    var reducedArray: [Int] = []
    
    

    
//    var index = 0
//    while index < array.count - 1 {
//        if array[index] < array[index + 1] {
//            reduced.append(1)
//        } else {
//            reduced.append(-1)
//        }
//        index += 1
//    }
    
    
    
    
//    for (index, num) in reduced.enumerated() {
//        if index == 0 {
//            reducedArray.append(1)
//        } else if num == 1 {
//            print(num)
//            var next = reduced[index - 1]
//            next += 1
//
//            reducedArray.append(next)
//        } else if num == -1 {
//            print(num)
//            var next = reduced[index - 1]
//            print(next)
//            next -= 1
//            reducedArray.append(next)
//        }
//    }
    
    print(reducedArray)
    
    return []
}

reduceDistanceKeepPriority(array: [1, 4, 8, 4])

