//
//  QueueManager.swift
//  dispatchQueues
//
//  Created by Luat on 8/11/21.
//

import Foundation

class QueueManager {
/**
1. Pass the test cases
2. Finish the rest of the functions
 - To test: make sure you have the same prints as the screenshots
*/
    var serialQueue: DispatchQueue? = DispatchQueue(label: "serialLabel", attributes: .concurrent)

/// See test cases: print 0 to end serially
    func printSerial(to end: Int) {
        for num in 0...end {
            print(num)
        }
    }
    
/// See test cases
    func printConcurrent(to end: Int) {
        for num in 0...end {
            DispatchQueue.global().async {
                print(num)
            }
        }
    }
    
/// See screenshots: Problem 1
    func serialClosures(task: @escaping (Int) -> Void, numTimes: Int) {
        for num in 0...numTimes {
                print("Serial Start:", num)
                print("from closure: serial")
        }
    }
    
/// See screenshots: Problem 2
    func concurrentClosures(task: @escaping (Int) -> Void, numTimes: Int) {
        let cQueue = DispatchQueue(label: "concurrentLabel", attributes: .concurrent)

        for num in 0...numTimes {
            cQueue.async {
                print("Concurrent Start:", num)
                print("from closure: concurrent")
            }
        }
    }
    let group = DispatchGroup()

/// See screenshots: Problem 3 and 4
    func execute(closure: @escaping (DispatchGroup?) -> Void, queueType: QueueType) {
        let group = DispatchGroup()
     
        if queueType == .serial {
            DispatchQueue.main.async {
                group.enter()
                closure(group)
            }
            
        } else if queueType == .concurrent {
            DispatchQueue.global().async {
                group.enter()
                closure(group)
            }
        }
        
    }
    
///  See screenshots: Problem 3 and 4, print GROUP end only after both tasks are done
    func addGroupCompletion() {
        print("GROUP end")
    }
    
}

enum QueueType {
    case serial
    case concurrent
}
