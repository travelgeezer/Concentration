//
//  Card.swift
//  Concentration
//
//  Created by geezer. on 20/12/2017.
//  Copyright © 2017 geezer. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    static var identifierFactory = 0
    
    static func getIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getIdentifier()
    }
}
