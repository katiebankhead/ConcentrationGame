//
//  EmojiConcentrationGame.swift
//  EmojiConcentrationGame
//
//  Created by Katie Bankhead on 9/8/21.
//

// VIEWMODEL

import SwiftUI

class EmojiConcentrationGame {
    private var game = createGame()
    
    static let emojis = ["🥖", "🧋", "🍓", "🍬", "🫐"]
    
    static let pairCount = Int.random(in: 2...5)
    
    static func createGame() -> ConcentrationGame<String> {
        var deck = ConcentrationGame<String>(numberOfPairsOfCards: pairCount) { index in
            emojis[index]
        }
        
        if deck.cards.count > 0 {
            deck.cards.shuffle()
        }
        
        return deck
    }
    
    // MARK: - Access to model
    
    var cards: Array<ConcentrationGame<String>.Card> {
        game.cards
    }
    
    // MARK: - Intents
    
    func choose(card: ConcentrationGame<String>.Card) {
        game.choose(card: card)
    }
}
