//
//  ContentView.swift
//  ConcentrationHW3
//
//  Created by Katie Bankhead on 9/8/21.
//

// VIEW

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiConcentrationGame
    
    var body: some View {
        HStack {
            ForEach(0 ..< 4) { index in
                CardView(card: viewModel.cards[index])
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
        ContentView(viewModel: EmojiConcentrationGame())
    }
}
