//
//  ConcentrationGame.swift
//  ConcentrationGame
//
//  Created by Katie Bankhead on 9/8/21.
//

// MODEL

import Foundation

struct ConcentrationGame<CardContent> {
    var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    mutating func choose(_ card: Card) {
        print("You chose \(card)")
        // find the corresponding card in the actual cards array
        // flip card
        if let cardIndex = cards.index(of: card) {
            cards[cardIndex].isFaceUp.toggle()
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
        var id: Int

    }
}
