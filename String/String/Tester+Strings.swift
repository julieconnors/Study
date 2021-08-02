//
//  Tester+Strings.swift
//  String
//
//  Created by Luat on 8/2/21.
//

import Foundation

extension Tester {
    /// Creating a git conflict
    /// Using print command
    func printWord(word: String) {
        print(word)
    }
    
    /// input "hello" should print "Hello"
    func printUpperCase(word: String) {
        var newWord: String = ""

        for char in word {
            newWord += char.uppercased()
        }
        
        print(newWord)
    }
    
    /// Using for loop, print each char in word
    func printLetters(word: String) {
        for char in word {
            print(char)
        }
    }
    
    /// Using for-in-enumerated(), print odd-index chars in word
    func printOddCharsEnumerated(word: String) {
        for (index, char) in word.enumerated() {
            if index % 2 == 0 {
                print(char)
            }
        }
    }
    
    /// Using for-in-stride and string.index, print odd-index chars in word
    func printOddCharsStrideIndex(word: String) {
        let firstIndex = word.startIndex
        
        for char in stride (from: 0, to: word.count, by: 2) {
            let letterIndex = word.index(firstIndex, offsetBy: char)
            print(word[letterIndex])
        }
    }
    
    /**
     Pig Latin:
     1) Move the first letter to the end and add "ay"
     pig -> igpay
     latin -> atinay
     2) IF word starts with a vowel, add "yay" to the word
     one -> oneyay
     */
    func printPigLatin(word: String) {
        let firstIndex = word.startIndex
        let firstLetter = word[firstIndex]
        print(word[firstIndex])
        if ["a", "e", "i", "o", "u"].contains(word[firstIndex]) {
            print(word + "yay")
        } else {
            var newWord = word
            newWord.removeFirst()
            newWord.append(firstLetter)
            print(newWord + "ay")
        }
    }
    
    /// Using loop and string.index, returns true if input is a palindrome
    func isPalindrome(word: String) -> Bool {
        let reverse = String(word.reversed())
        
        return reverse == word ? true : false
    }
}
