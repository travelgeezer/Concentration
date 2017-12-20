//
//  ViewController.swift
//  Concentration
//
//  Created by geezer. on 20/12/2017.
//  Copyright © 2017 geezer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (touchButtons.count + 1) / 2)
    
    @IBOutlet var touchButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let button = touchButtons.index(of: sender) {
            game.chooseCard(at: button)
            updateViewFromModel()
        } else {
            print("no bind to touchButtons")
        }
    }
    
    var emojiChoices = ["🧐", "🤓", "🤪", "🤓", "🤬", "🤔", "🤭", "🤫", "🤥"]
    
    var emoji = [Int:String]()
    
    func updateViewFromModel() {
        for index in touchButtons.indices {
            let button = touchButtons[index]
            let card = game.cards[index]
            if (card.isFaceUp) {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}
