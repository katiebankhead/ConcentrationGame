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
    
    var score: Int {
        cards.reduce(0) { total, card in
            total + card.score
        }
    }
    
    var indexOfTheOnlyFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            
            cards.append(Card(content: content))
            cards.append(Card(content: content))
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
                }
                indexOfTheOnlyFaceUpCard = nil
//                cards[chosenIndex].isFaceUp = true
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                
                indexOfTheOnlyFaceUpCard = chosenIndex
            }
            
            cards[chosenIndex].viewCount += 1
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    mutating func turnFaceDown(_ card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card), cards[chosenIndex].isMatched {
            cards[chosenIndex].isFaceUp = false
        }
    }
    
    struct Card: Identifiable {
        fileprivate(set) var isFaceUp = false {
            didSet {
                if isFaceUp {
                    startUsingBonusTime()
                } else {
                    stopUsingBonusTime()
                }
            }
        }
        fileprivate(set) var isMatched = false {
            didSet {
                stopUsingBonusTime()
            }
        }
        fileprivate(set) var viewCount = 0
        fileprivate(set) var content: CardContent
        fileprivate(set) var id = UUID()
        
        var score: Int {
            if isMatched {
                return 3 - viewCount + Int(bonusRemaining * 5)
            }

            if viewCount > 0 {
                return -viewCount + 1
            }

            return 0
        }

        // MARK: - Bonus Time
        
        var bonusTimeLimit: TimeInterval = Constants.bonusTimeLimit
        var lastFaceUpTime: Date?
        var pastFaceUpTime: TimeInterval = Constants.pastFaceUpTime
        
        var bonusTimeRemaining: TimeInterval {
            max(0, bonusTimeLimit - faceUpTime)
        }
        
        var bonusRemaining: Double {
            (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining / bonusTimeLimit : 0
        }
        
        var hasEarnedBonus: Bool {
            isMatched && bonusTimeRemaining > 0
        }
        
        var isConsumingBonusTime: Bool {
            isFaceUp && !isMatched && bonusTimeRemaining > 0
        }
        
        private var faceUpTime: TimeInterval {
            if let lastFaceUpTime = lastFaceUpTime {
                return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpTime)
            } else {
                return pastFaceUpTime
            }
        }
        
        private mutating func startUsingBonusTime() {
            if isConsumingBonusTime && lastFaceUpTime == nil {
                lastFaceUpTime = Date()
            }
        }
        
        private mutating func stopUsingBonusTime() {
            pastFaceUpTime = faceUpTime
            lastFaceUpTime = nil
        }
    }
}

fileprivate struct Constants {
    static let bonusTimeLimit: TimeInterval = 12
    static let pastFaceUpTime: TimeInterval = 0
}
