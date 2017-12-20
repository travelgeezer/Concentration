//
//  Concentration.swift
//  Concentration
//
//  Created by geezer. on 20/12/2017.
//  Copyright © 2017 geezer. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
           
                if cards[index].identifier == cards[matchIndex].identifier {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp  = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        sortCards()
    }
    
    func sortCards() {
        for index in cards.indices {
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            let randomCard = cards[randomIndex]
            let card = cards[index]
            cards[index] = randomCard
            cards[randomIndex] = card
        }
    }
}
