//import UIKit
//
//var greeting = "Hel🤣lo"
//
//var char: Character = "🤣"
//var str: String = "a"
//
//var myInt: Int = 1
//var myDoub: Double = 1.0
//
//if String(char) == str {
//
//} else {
//    print("not same")
//    print("char: \(char)")
//}
//
//print(greeting)
//
//for num in 0...3 {
//    print(num)
//}
//
//for num in 0..<3 {
//    print(num)
//}
//
//for num in stride(from: 0, to: 10, by: 2) {
//    print("stride:", num)
//}
//
//for letter in greeting {
//    print(letter)
//}
//
//for (index, letter) in greeting.enumerated() {
////    if index == 3 {
//        print("index: \(index), letter: \(letter)")
////    }
//}
////var greeting = "Hel🤣lo"
//var hIndex = greeting.startIndex
//greeting[hIndex] // greeting[0]
//
//var nextIndex = greeting.index(hIndex, offsetBy: 1)
//greeting[nextIndex] // greeting[1]
//
//for num in 0..<greeting.count {
//    let nextIndex = greeting.index(hIndex, offsetBy: num)
//    print(greeting[nextIndex])
//}



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

/**
 Pig Latin:
 1) Move the first letter to the end and add "ay"
 pig -> igpay
 latin -> atinay
 2) IF word starts with a vowel, add "yay" to the word
 one -> oneyay
 */

printPigLatin(word: "hello")
