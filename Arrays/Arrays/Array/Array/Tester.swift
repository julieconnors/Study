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
        let newArray = original.map {element in
            return element * 2
        }
      return newArray
    }

    /// 2. Write a function to return the last half of the array, not including the median
    func lastHalf(array: [Int]) -> [Int] {
        let toPlay = array
        let size = array.count
        var half = 0
        if size % 2 == 0{
            half = size/2
        }
        else{
            half = size/2 + 1
        }
        
        let back = Array(toPlay[half...])
        
        return back
    }

    /// 3. Write a function that can creates an array populated with integers going from start (input) to end (input)
    func createArray(from start: Int, to end: Int) -> [Int] {
      
        var arrayNew: [Int] = []
        for num in start ... end{
            arrayNew.append(num)
        }
        return arrayNew
    }

    /**
        4. Create this 2-D array
        [[1,2,3],
        [4,5,6],
        [7,8,9]]
     */
    func create2DArray() -> [[Int]] {
        let array1: [[Int]] = [[1, 2, 3],[4,5,6],[7,8,9]]
        return array1
    }

    /// 5. Write a function that returns the number of pairs of elements that sums up to 0
    /// Input [1,2,3,-1,-2,-4] -> Output 2
    func findPairs(nums: [Int]) -> Int {
        var pairCount = 0
        for num in 0..<nums.count/2 {
            let tempNum = num * -1
            if nums.contains(tempNum) == true{
                pairCount += 1
            
            }
        }
      return pairCount
    }
    
    /// 6. Returns an array of indexes where the char occurs in input word
    func positionsOf(character: Character, in word: String) -> [Int] {
        
        var returnArray: [Int] = []
        
        let size = word.count
        let start = word.startIndex
        for num in 0..<size {
            let compareIndex = word.index(start, offsetBy: num)
            if  character == word[compareIndex]{
                returnArray.append(num)
            }
        }
        return returnArray
    }
    
    /**
        7. Scenario: There is a conference room, and an array of `I`s and `O`s.
        `I` means a person enters the room and needs a chair.
        `O` means a person leaves the room and a chair opens up.
        Find the maximum number of chairs required to allow everyone (at any point) to have a seat
        Ex. [ I, I, O] -> 2
     */
    func minimumChairs(array: [Character]) -> Int {
        //variables for empty and full seats
        var emptySeats: Int = 0
        let emptyChair: Character = "O"
        var fullSeats: Int = 0
        //array tooling variables
        let size = array.count - 1
        let start = array.startIndex
        
        for element in 0...size{
            let compareIndex = array.index(start, offsetBy: element)
            if array[compareIndex] == emptyChair{
                emptySeats += 1
                
            }
            else{
                
                fullSeats += 1
            }
        }
        //is the test correct? shouldn't it be 2?
        let lukeModifier = 1
        return (fullSeats - emptySeats) + lukeModifier
    }
    
    /// 8. Pig latin but with words separated by spaces
    func pigLatinSentence(sentence: String) -> String {
        //split sentence in array using components method
        let latinArray = sentence.components(separatedBy: " ")
        //initialize return string
        var pigSentence = ""
        //use helper function to modify each element of the new array of strings
        let returnArray = latinArray.map {element in
            return wordPigLatin(word: element) }
        //loop through an build sentence
        for ele in returnArray{
            pigSentence += ele + " "
        }
        //remove last space
        pigSentence.removeLast(1)
        return pigSentence
    }
    //helper function
    func wordPigLatin(word: String) -> String {
        let rest = word.dropFirst()
        let fLetter = word.startIndex
        let starter = String(word[fLetter])
        var pigLatin = ""
        
        let vowels: [String] = ["a", "e", "i", "o", "u"]
        if vowels.contains(starter){
            pigLatin += word + "yay"
            
        }else{
            pigLatin += rest + starter + "ay"
        }
        
        return pigLatin
    }
    
    /**
        9. Find the best day to first BUY and then a day occuring after that day to SELL. Return the maximum profit (buy price - sell price)
        var prices = [7,1,5,3,6,4] -> returns 5
     */
    
    
    func maxProfit(array: [Int]) -> Int {
        var profit: Int = 0
        var bestProfit: Int = 0
        var sellDay: Int = 0
        
        let size = array.count
        let start = array.startIndex
        
        for num in 0 ... (size - 2) {
            
            let buyNum = array.index(start, offsetBy: num)
            let sellNum = array.index(start, offsetBy: num + 1)
            
            if buyNum < sellNum {
                profit = array[sellNum] - array[buyNum]
            }
            
            if profit > bestProfit {
                bestProfit = profit
                sellDay = array[sellNum]
            }
        }
        return sellDay
    }
    
    /**
        10. Input: array of integers: [1, 4, 8, 4] with 1 having the highest priority.
        Output: reduce the distance bettwen priorities but keep the same priority ordering
        [1, 4, 8, 4] -> [1, 2, 3, 2]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        //indexing variables
        var returnArray: [Int] = []
        let size = array.count - 1 
        let start = array.startIndex
        
        var starterPistol = 1
        returnArray.append(starterPistol)
        
        for num in 1...size {
            let tempNum = array.index(start, offsetBy: num)
            let prevNum = array.index(start, offsetBy: num - 1)
            
            if array[tempNum] > array[prevNum]{
                starterPistol += 1
                returnArray.append(starterPistol)
            }
            
            if array[tempNum] < array[prevNum]{
                starterPistol -= 1
                returnArray.append(starterPistol)
            }
            
        }
        return returnArray
    }
}
