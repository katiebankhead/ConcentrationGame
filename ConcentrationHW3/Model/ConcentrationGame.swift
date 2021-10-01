//
//  ConcentrationGame.swift
//  ConcentrationGame
//
//  Created by Katie Bankhead on 9/8/21.
//

// MODEL

import Foundation

struct ConcentrationGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private(set) var points: Int = 0
    
    var indexOfTheOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        
        cards.shuffle()
    }
    
    mutating func choose(_ card: Card) {
        // find the corresponding card in the actual cards array, flip card
        if let chosenIndex = cards.firstIndex(matching: card),
                !cards[chosenIndex].isFaceUp,
                !cards[chosenIndex].isMatched {
            
            // if one card is already face up
            if let potentialMatchIndex = indexOfTheOnlyFaceUpCard {
                // if match
                if cards[potentialMatchIndex].content == cards[chosenIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    points += 2
                } else {
                    // penalize 1 point for every previously seen card in a mismatch
                    if cards[chosenIndex].isAlreadySeen {
                        points -= 1
                    } else {
                        cards[chosenIndex].isAlreadySeen = true
                    }
                    
                    if cards[potentialMatchIndex].isAlreadySeen {
                        points -= 1
                    } else {
                        cards[potentialMatchIndex].isAlreadySeen = true
                    }
                }
                
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOnlyFaceUpCard = chosenIndex
            }
            
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    struct Card: Identifiable {
        fileprivate(set) var isFaceUp = false
        fileprivate(set) var isMatched = false
        fileprivate(set) var isAlreadySeen = false
        fileprivate(set) var content: CardContent
        fileprivate(set) var id: Int

    }
}
