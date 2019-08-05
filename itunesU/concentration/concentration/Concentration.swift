//
//  Concentration.swift
//  concentration
//

import Foundation

struct Concentration {

    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            // look at all the cards and see if you find only one card that's face up
            // if so, return it, else return nil
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceup {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        
        set {
            // turn all the cards face down except the card at index newValue
            for index in cards.indices {
                cards[index].isFaceup = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards.")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceup = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
                
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "numberOfPairsOfCards")
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        shuffleCards()
    }
    
    private mutating func shuffleCards() {
        var shuffledCards = [Card]()
        
        while !cards.isEmpty{
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            shuffledCards.append(cards[randomIndex])
            cards.remove(at: randomIndex)
        }
        
        cards = shuffledCards
    }
}
