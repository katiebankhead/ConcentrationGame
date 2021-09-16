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
    
    // no side effects, so function name is a noun
    private func columns(for size: CGSize) -> [GridItem] {
        Array(repeating: GridItem(.flexible()), count: Int(size.width / Constants.desiredCardWidth))
    }
    
    func newGame() -> Void {
        print("start new game")
    }
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                LazyVGrid(columns: columns(for: geometry.size)) {
                    ForEach(emojiGame.cards) { card in
                        CardView(card: card)
                            .onTapGesture(perform: { emojiGame.choose(card)
                        })
                    }
                }
                .padding()
                .foregroundColor(.blue)
            }
            Spacer()
            HStack{
//                ZStack {
//                    Rectangle()
//                        .stroke(.black)
//                        .frame(width: 150, height: 50)
//                    Text("14")
//                }
//                Spacer()
                ZStack {
                    Capsule()
                        .fill(Color.green)
                        .frame(width: 150, height: 50)
                    Text("New Game")
                        .font(.body)
                }
                .onTapGesture(perform: { emojiGame.reset()})
            }
            .padding()
        }
    }
    
    private struct Constants {
        static let desiredCardWidth: CGFloat = 125
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiGameView(emojiGame: EmojiConcentrationGame())
    }
}
