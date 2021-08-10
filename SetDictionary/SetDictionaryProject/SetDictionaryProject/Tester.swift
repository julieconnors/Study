//
//  Tester.swift
//  SetDictionaryProject
//
//  Created by Luat on 8/4/21.
//

import Foundation

struct Tester {
    /// Remove an array with the duplicated values removed
    func removeDups(nums: [Int]) -> [Int] {
        var uniqueNums: Set<Int> = []
        
        for num in nums {
            uniqueNums.insert(num)
        }
        
        let uniqueNumArray: [Int] = Array(uniqueNums)
        return uniqueNumArray
    }
    
    /// Find the nums that exist in both arrays
    func findCommonNums(from firstNums: [Int], and secondNums: [Int]) -> [Int] {
        let firstSet: Set<Int> = Set(firstNums)
        
        let secondSet: Set<Int> = Set(secondNums)
        
        let commonNums: Set<Int> = firstSet.intersection(secondSet)
        let commonNumArray: [Int] = Array(commonNums)

        return commonNumArray
    }
    
    /// first: "hello", second: "bye" -> ["e"]
    func findMatchingLetters(firstWord: String, secondWord: String) -> [Character] {
        let firstSet: Set<Character> = Set(firstWord)
        
        let secondSet: Set<Character> = Set(secondWord)
        
        let matchingLetters = firstSet.intersection(secondSet)
        let matchingLetterArray = Array(matchingLetters)
        
        return matchingLetterArray
    }
    
    
    /// Create a dictionary of the counts of the letters, ignoring spaces
    func createCounter(string: String) -> [Character: Int] {
        let stringWithoutSpaces = string.split(separator: " ").joined(separator: "")
        
        var letterCounter: [Character: Int] = [:]
        for letter in stringWithoutSpaces {
            if let char = letterCounter[letter]{
                letterCounter[letter] = char + 1
            } else {
                letterCounter[letter] = 1
            }
            
        }
        return letterCounter
    }
    
    /// Find most frequent letter in string: "hello there" -> "e"
    func mostFrequentLetter(string: String) -> Character {
        let letterCounter = createCounter(string: string)
        var maxValue: Int = 0
        var mostFrequent: Character = "a"
        for (key, value) in letterCounter {
            if value > maxValue {
                maxValue = value
                mostFrequent = key
            }
        }
        return mostFrequent
    }
    
    /// O(n) time: avoid nested for loops
    func findPairs(nums: [Int]) -> Int {
        var negativeNums: [Int] = []
        for num in nums {
            if num < 0 {
                negativeNums.append(num)
            }
        }
        
        var pairs: [Int] = []
        for num in negativeNums {
            pairs += nums.filter{$0 + num == 0}
        }
        return pairs.count
//        var counter = 0
//        var dictionary = [String: Int]()
//
//        nums.forEach { num in
//            let transformedNum = abs(num)
//            let key = String(transformedNum)
//
//            if let _ = dictionary[key] {
//                counter += 1
//                dictionary.removeValue(forKey: key)
//            } else {
//                dictionary[key] = transformedNum
//            }
//
//        }
//
//        return counter
    }
    
    /**
     Using Dictionary:
     Input: array of integers: [1, 4, 8, 1] with 1 having the highest priority.
     Output: reduce the distance bettwen priorities but keep the same priority ordering
     [1, 4, 8, 1] -> [1, 2, 3, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        let sorted: [Int] = Array(Set(array)).sorted()
        let priority: Int = array.min() ?? 0
        
        var dict: [Int: Int] = [:]

        for (index, ele) in sorted.enumerated() {
            if ele == priority {
                dict[ele] = 1
        } else {
            dict[ele] = index + 1
            }
        }
        
        var toReturn: [Int] = []
        for ele in array {
            let unwrapped: Int = dict[ele] ?? 0
            toReturn.append(unwrapped)
        }
        
//        let sorted: [Int] = array.sorted()
//        let priority: Int = array.min() ?? 0
//
//        var dict: [Int: Int] = [:]
//
//        if priority != 1 {
//            for (index, ele) in sorted.enumerated() {
//                if ele == priority {
//                    dict[ele] = 1
//                } else {
//                    dict[ele] = index + 1
//                }
//            }
//        } else {
//            for (index, ele) in array.enumerated() {
//                if ele == priority {
//                    dict[ele] = 1
//                } else {
//                    dict[ele] = index + 1
//                }
//            }
//        }
//        print(array)
//        print(dict)
//        var toReturn: [Int] = []
//        for ele in array {
//            let unwrapped: Int = dict[ele] ?? 0
//            toReturn.append(unwrapped)
//        }
//        print(toReturn)
        return toReturn
    }
    
    /// Optionals
    /// Unwrap using optional binding: if let
    func unwrap(optional: Int?) -> Int {
        if let num = optional {
            return num
        } else {
            return 0
        }
    }
    
    /// Unwrap using optional binding: guard let
    func unwrap(optional: String?) -> String {
        guard let string = optional else {
            fatalError("no string")
        }
        return string
    }
    
    /// Unwrap using nil coalescing
    /// takes optional array, return first value?
    func unwrap(optional: [Int]?) -> Int {
        let array = optional ?? []
        let first = array[0]
        return first
    }
    
    /// Create a url from a string address, avoid force unwrapping
    func createURL(from address: String?) -> URL {
        let unwrapped = address ?? ""
        let url = URL(string: unwrapped)
        
        guard let unwrappedURL = url else {
            fatalError("no value")
        }
        
        return unwrappedURL
    }
    
    
    /// Input array of [Int?], unwrap each Int? and return the an array of Int
    /// Input [Int?] = [1, nil, nil, 2] -> [1, 2]
    func unwrapElementsInArray(array: [Int?]) -> [Int] {
        var unwrapped: [Int] = []
        for ele in array {
            if let arrEle = ele {
                unwrapped.append(arrEle)
            }
        }
        return unwrapped
    }
    
    /// Unwrap using nil coalescing
    /// takes optional dictionary, return value at key?
    func unwrap(optional: [Int: Int]?, key: Int?) -> Int {
        let unwrapped = optional ?? [:]
        let unwrappedKey = key ?? 0
        let unwrappedValue: Int = unwrapped[unwrappedKey] ?? 0
        return unwrappedValue
    }
    
    /// Unwrap using optional chaining and optional binding
    /// takes nested optional array, return first value?
    func unwrap(optional: [[Int]?]?) -> Int {
        var nestedInt: Int = 0
        if let array = optional {
            if let nested = array[0] {
                nestedInt = nested[0]
            }
        }
        return nestedInt
    }
    
    /// Unwrap using implicitly unwrap
    func implicitUnwrap(optional: Int?) -> Int {
        let implicitUnwrapped: Int! = optional
        let unwrapped: Int = implicitUnwrapped
        return unwrapped
    }
}


