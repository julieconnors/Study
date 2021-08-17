//
//  Tester.swift
//  Array
//
//  Created by Luat on 5/19/21.
//

import Foundation

class Tester {
    static let shared = Tester()
    
    /// 1. Write a function that takes an array of numbers and returns an array with each of the numbers multiplied by 2
    func multiplyByTwo(numbers original: [Int]) -> [Int]{
        return original.map { $0 * 2 }
    }

    /// 2. Write a function to return the last half of the array, not including the median
    func lastHalf(array: [Int]) -> [Int] {

        let mid = array.count / 2
        let subArray = array.dropFirst(mid)
        return array.count % 2 == 1 ? Array(subArray.dropFirst()) : Array(subArray)
        
//        let newArr = array.enumerated().filter { (index, element) in
//            return index > array.count / 2
//        }
//        return newArr.map { (index, element) in
//            return element
//        }
    }

    /// 3. Write a function that can creates an array populated with integers going from start (input) to end (input)
    func createArray(from start: Int, to end: Int) -> [Int] {
        return Array(start...end)
    }

    /**
        4. Create this 2-D array
        [[1,2,3],
        [4,5,6],
        [7,8,9]]
     */
    func create2DArray() -> [[Int]] {
        var result: [[Int]] = []
        var nestedArr: [Int] = []
        for num in 1...9 {
            nestedArr.append(num)
            if num % 3 == 0 {
                result.append(nestedArr)
                nestedArr = []
            }
        }
      return result
    }

    /// 5. Write a function that returns the number of pairs of elements that sums up to 0
    /// Input [1,2,3,-1,-2,-4] -> Output 2
    func findPairs(nums: [Int]) -> Int {

        var count = 0
        for element in nums {
            for innerElement in nums {
                if element + innerElement == 0 {
                    count += 1
                }
            }
        }
      return count / 2
    }
    
    /// 6. Returns an array of indexes where the char occurs in input word
    func positionsOf(character: Character, in word: String) -> [Int] {
        var result: [Int] = []
        for (index, char) in word.enumerated() {
            if char == character {
                result.append(index)
            }
        }
        return result
    }
    
    /**
        7. Scenario: There is a conference room, and an array of `I`s and `O`s.
        `I` means a person enters the room and needs a chair.
        `O` means a person leaves the room and a chair opens up.
        Find the maximum number of chairs required to allow everyone (at any point) to have a seat
        Ex. [ I, I, O] -> 2
     */
    func minimumChairs(array: [Character]) -> Int {
        var count = 0
        var maxCount = 0
        for char in array {
            if char == "I" {
                count += 1
                if maxCount < count {
                    maxCount = count
                }
            } else {
                count -= 1
            }
        }
        return maxCount
    }
    
    /// 8. Pig latin but with words separated by spaces
    func pigLatinSentence(sentence: String) -> String {
        var result = ""
        for word in sentence.split(separator: " ") {
            result += returnPigLatin(word: String(word)) + " "
        }
        return String(result.dropLast())
    
    }
    
    func returnPigLatin(word: String) -> String {
        let vowels = "aeiou"
        let firstLetter = String(word[word.startIndex])
        if vowels.contains(firstLetter) {
            return word + "yay"
        } else {
            let truncWord = word.dropFirst()
            return truncWord + firstLetter + "ay"
        }
    }
    
    /**
        9. Find the best day to first BUY and then a day occuring after that day to SELL. Return the maximum profit (buy price - sell price)
        var prices = [7,1,5,3,6,4] -> returns 5
     */
    
    
    func maxProfit(array: [Int]) -> Int {
        var min = array[0]
        var maxDiff = 0
        for price in array {
            if min > price {
                min = price
            }
            let diff = price - min
            if maxDiff < diff {
                maxDiff = diff
            }
        }
        return maxDiff
    }
    
    /**
        10. Input: array of integers: [1, 4, 8, 4] with 1 having the highest priority.
        Output: reduce the distance bettwen priorities but keep the same priority ordering
        [1, 4, 8, 4] -> [1, 2, 3, 2]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        let sorted = array.sorted() // 1, 4, 4, 8
                                    // 1, 2,
        let max = array.max()!
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
        /// [1, 4, 8, 4]
        /// [1, 2, 3, 2]
        for num in array {
            let newPriority = priorities[num]
            result.append(newPriority)
        }
        return result
    }
}
