//
//  EmojiGameView.swift
//  ConcentrationHW3
//
//  Created by Katie Bankhead on 9/8/21.
//

// VIEW

import SwiftUI

struct EmojiGameView: View {
    @ObservedObject var emojiGame: EmojiConcentrationGame
    
    @State private var dealtCards = Set<UUID>()
    @Namespace private var dealingCards
    
    var body: some View {
        ZStack(alignment: .bottom) {
            gameBody
            deckBody
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationTitle("\(emojiGame.theme.name)")
        .navigationBarItems(leading: Button("New Game") {
            withAnimation {
                emojiGame.reset()
                dealNewGame()
            }
        }, trailing: Text("Score: \(emojiGame.score) [\(emojiGame.overallHighScore)]"))
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if emojiGame.hasDealt {
                for card in emojiGame.cards {
                    deal(card)
                    
                    if card.isMatched {
                        emojiGame.turnFaceDown(card)
                    }
                }
            }
        }
    }
    
    var gameBody: some View {
        GeometryReader { geometry in
            AspectVGrid(items: emojiGame.cards, aspectRatio: Constants.aspectRatio) { card in
                    if !isUndealt(card) {
                        CardView(card: card, gameType: emojiGame.theme.gameType)
                            .zIndex(zIndex(for: card))
                            .matchedGeometryEffect(id: card.id, in: dealingCards)
                            .transition(AnyTransition.asymmetric(insertion: .identity, removal: .scale))
                            .padding(geometry.size.width * 0.01)
                            .onTapGesture {
                                withAnimation {
                                    emojiGame.choose(card)
                                }
                            }
                    }
            }
            .padding(geometry.size.width * 0.01)
            .foregroundColor(ColorHelper.color(for: emojiGame.theme.color))
        }
    }
    
    var deckBody: some View {
        ZStack {
            ForEach(emojiGame.cards) { card in
                if isUndealt(card) {
                    CardView(card: card, gameType: emojiGame.theme.gameType)
                        .zIndex(zIndex(for: card))
                        .matchedGeometryEffect(id: card.id, in: dealingCards)
                        .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity))
                }
            }
        }
        .foregroundColor(ColorHelper.color(for: emojiGame.theme.color))
        .frame(width: Constants.deckWidth, height: Constants.deckHeight)
        .offset(x: randomOffset(), y: randomOffset())
        .padding(.bottom)
        .onAppear {
            dealNewGame()
            emojiGame.hasDealt = true
        }
    }
    
    private func dealNewGame() {
        for card in emojiGame.cards {
            withAnimation(dealAnimation(for: card)) {
                deal(card)
            }
        }
    }
    
    private func randomOffset() -> CGFloat {
        if Bool.random() {
            return CGFloat.random(in: 1500...2000)
        } else {
            return -CGFloat.random(in: 1500...2000)
        }
    }
    
    private func dealAnimation(for card: ConcentrationGame<String>.Card) -> Animation {
        var delay = 0.0
        
        if let index = emojiGame.cards.firstIndex(matching: card) {
            delay = Double(index) * Constants.totalDealDuration / Double(emojiGame.cards.count)
        }
        
        return Animation.easeInOut(duration: Constants.dealDuration).delay(delay)
    }
    
    private func deal(_ card: ConcentrationGame<String>.Card) {
        dealtCards.insert(card.id)
    }
    
    private func isUndealt(_ card: ConcentrationGame<String>.Card) -> Bool {
        !dealtCards.contains(card.id)
    }
    
    private func zIndex(for card: ConcentrationGame<String>.Card) -> Double {
        -Double(emojiGame.cards.firstIndex(matching: card) ?? 0)
    }
    
    private struct Constants {
        static let aspectRatio: CGFloat = 2/3
        static let dealDuration = 0.5
        static let deckHeight: CGFloat = 150
        static let deckWidth = deckHeight * aspectRatio
        static let totalDealDuration = 2.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiGameView(emojiGame: EmojiConcentrationGame(themes[0]))
    }
}
