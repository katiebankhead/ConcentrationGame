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
    var hasDealt = false
    var player = SoundPlayer()
    @AppStorage(Settings.playSoundKey) var playSound: Bool = false
    
    init(_ theme: Theme) {
        game = EmojiConcentrationGame.createGame(theme: theme)
        self.theme = theme
    }
        
    private static func createGame(theme: Theme) -> ConcentrationGame<String> {
        ConcentrationGame<String>(theme: theme, numberOfPairsOfCards: Int.random(in: 2...theme.numberOfPairsOfCards)) { index in
            theme.content[index]
        }
    }
    
    // MARK: - Access to model
    
    var cards: Array<ConcentrationGame<String>.Card> {
        game.cards
    }
    
    var overallHighScore: Int {
        game.overallHighScore
    }
    
    var score: Int {
        game.score
    }
    
    // MARK: - Intents
    
    func choose(_ card: ConcentrationGame<String>.Card) {
        let score1 = game.score
        game.choose(card)
        let score2 = game.score
        
        if playSound {
            if score2 > score1 {
                player.playSound(named: "Tada.m4a")
            }
        }
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
