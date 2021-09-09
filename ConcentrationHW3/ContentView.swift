//
//  ContentView.swift
//  ConcentrationHW3
//
//  Created by Katie Bankhead on 9/8/21.
//

// VIEW

import SwiftUI

struct ContentView: View {
    var emojiGame: EmojiConcentrationGame
    
    var body: some View {
        HStack {
            ForEach(emojiGame.cards) { card in
                CardView(card: card).onTapGesture(perform: { emojiGame.choose(card: card)
                })
            }
        }
        .padding()
    }
}

struct CardView: View {
    var card: ConcentrationGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke()
                Text(card.content)
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10)
            }
        }
        .foregroundColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(emojiGame: EmojiConcentrationGame())
    }
}
