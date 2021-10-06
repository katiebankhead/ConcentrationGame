//
//  EmojiConcentrationGame.swift
//  EmojiConcentrationGame
//
//  Created by Katie Bankhead on 9/8/21.
//

// VIEWMODEL

import SwiftUI

class EmojiConcentrationGame: ObservableObject {
    @Published private var game = createGame()
    
    private static let emojis = ["🥖", "🧋", "🍓", "🍬", "🫐"]
        
    private static func createGame() -> ConcentrationGame<String> {
        ConcentrationGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { index in
            emojis[index]
        }
    }
    
    // MARK: - Access to model
    
    var cards: Array<ConcentrationGame<String>.Card> {
        game.cards
    }
    
    var score: Int {
        game.score
    }
    
    // MARK: - Intents
    
    func choose(_ card: ConcentrationGame<String>.Card) {
        game.choose(card)
    }
    
    func reset() {
        game = EmojiConcentrationGame.createGame()
    }
}
