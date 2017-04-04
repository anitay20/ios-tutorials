//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
//
//
//var winningCombos = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
//                     [1, 4, 7], [2, 5, 8], [3, 6, 9],
//                     [1, 5, 9], [3, 5, 7]]
//
//for var combos in winningCombos {
//    for var i in combos {
//        print(i)
//    }
//}
//
//winningCombos
//
//for c in winningCombos {
//    print(c)
//    for i in c {
//        var hello = i
//        hello = hello - 1
//        print(hello)
//    }
//}
//
//winningCombos
//
//var combo = [1, 2, 3]
//for i in combo {
//    combo[i-1] -= 1
//}
//
//winningCombos[0].dropFirst()
//winningCombos[1].makeIterator()
//winningCombos[1].removeFirst()
//winningCombos[1]


let life = [("Who will you go with?", ["mother", "father"]), ("Who will you marry?", ["Anna", "Elise", "Jean"])]

var decisions: Int = 0
var choices: Int
var outcomes: Int

func getDecisions(_ life : [(String, [String])]) -> Int {
    decisions = life.count
    return decisions
}

func getChoices(_ life : [(String, [String])]) -> Int {
    var choice: Int = 0
    for decision in life {
        choice += decision.1.count
    }
    return choice
}

func getOutcomes(_ life : [(String, [String])]) -> Int {
    var outcome: Int = 1
    for decision in life {
        outcome *= decision.1.count
    }
    return outcome
}



