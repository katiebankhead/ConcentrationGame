//
//  EmojiConcentrationGame.swift
//  EmojiConcentrationGame
//
//  Created by Katie Bankhead on 9/8/21.
//

// VIEWMODEL

import SwiftUI

class EmojiConcentrationGame: ObservableObject {
    @Published private var game: ConcentrationGame<String>
    var theme: Theme
    
    init(_ theme: Theme) {
        game = EmojiConcentrationGame.createGame(theme: theme)
        self.theme = theme
    }
        
    var hasDealt = false
        
    private static func createGame(theme: Theme) -> ConcentrationGame<String> {
        ConcentrationGame<String>(numberOfPairsOfCards: Int.random(in: 2...theme.numberOfPairsOfCards)) { index in
            theme.content[index]
        }
    }
    
    @AppStorage(Settings.playSoundKey) private var playSound: Bool = false
    @AppStorage(Settings.highScoresKey) private var highScores: String = ""
    
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
        game = EmojiConcentrationGame.createGame(theme: theme)
        hasDealt = false
    }

    func turnFaceDown(_ card: ConcentrationGame<String>.Card) {
        if card.isMatched {
            game.turnFaceDown(card)
        }
    }
}
