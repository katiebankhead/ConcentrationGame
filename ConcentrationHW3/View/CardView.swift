//
//  CardView.swift
//  CardView
//
//  Created by Katie Bankhead on 9/9/21.
//

import SwiftUI

struct CardView: View {
    var card: ConcentrationGame<String>.Card
    var gameType: GameType
    
    @State private var animatedBonusRemaining = 0.0
    
    var body: some View {
        GeometryReader {  geometry in
            if !card.isMatched || card.isFaceUp {
                Group {
                    switch gameType {
                        case .emojiMojo:
                            emojiBody(size: geometry.size)
                        case .templeMatch:
                            templeBody(size: geometry.size)
                        case .shapeScape:
                            shapeBody(size: geometry.size)
                    }
                }
                .cardify(isFaceUp: card.isFaceUp)
                .transition(.scale)
                .clipped()
            }
        }
    }
    
    private func emojiBody(size: CGSize) -> some View {
        ZStack {
            if card.isConsumingBonusTime {
                Pie(startAngle: angle(for: 0),
                    endAngle: angle(for: -animatedBonusRemaining))
                    .padding(size.width * 0.04)
                    .opacity(0.4)
                    .onAppear {
                        animatedBonusRemaining = card.bonusRemaining
                        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
                            animatedBonusRemaining = 0
                        }
                    }
            } else {
                Pie(startAngle: angle(for: 0),
                    endAngle: angle(for: -card.bonusRemaining))
                    .padding(size.width * 0.04)
                    .opacity(0.4)
            }
            Text(card.content)
                .font(systemFont(for: size))
                .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                .animation(
                    card.isMatched
                    ? .linear(duration: 1.0).repeatForever(autoreverses: false)
                    : .default,
                    value: card.isMatched
                )
        }
    }
    
    private func templeBody(size: CGSize) -> some View {
        VStack {
            Image(card.content)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .offset(x: 0, y: card.isMatched ? 5 : 0)
                .animation(
                    card.isMatched
                        ? Animation
                            .easeInOut(duration: 0.25)
                            .repeatForever(autoreverses: true) : .default,
                    value: card.isMatched
                )
            if card.bonusRemaining > 0 {
                if card.isConsumingBonusTime {
                    CapsuleCountdown(value: animatedBonusRemaining, width: size.width - 40)
                        .padding()
                        .onAppear {
                            animatedBonusRemaining = card.bonusRemaining
                            withAnimation(.linear(duration: card.bonusTimeRemaining)) {
                                animatedBonusRemaining = 0
                            }
                        }
                } else {
                    CapsuleCountdown(value: card.bonusRemaining, width: size.width - 40)
                        .padding()
                }
            }
        }
    }
    
    private func shapeBody(size: CGSize) -> some View {
        ZStack {
            if card.isConsumingBonusTime {
                Pie(startAngle: angle(for: 0),
                    endAngle: angle(for: -animatedBonusRemaining))
                    .padding(size.width * 0.04)
                    .opacity(0.4)
                    .onAppear {
                        animatedBonusRemaining = card.bonusRemaining
                        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
                            animatedBonusRemaining = 0
                        }
                    }
            } else {
                Pie(startAngle: angle(for: 0),
                    endAngle: angle(for: -card.bonusRemaining))
                    .padding(size.width * 0.04)
                    .opacity(0.4)
            }
            shapeView(for: card.content)
                .padding(0.2 * max(size.height, size.width))
                .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                .animation(
                    card.isMatched
                    ? .linear(duration: 1.0).repeatForever(autoreverses: false)
                    : .default,
                    value: card.isMatched
                )
        }
    }
    
    @ViewBuilder
    private func shapeView(for shape: String) -> some View{
        if card.content == "triangle" {
            Triangle()
                .fill(.red)
        } else if card.content == "circle" {
            Circle()
                .fill(.yellow)
        } else if card.content == "rectangle" {
            Rectangle()
                .fill(.blue)
        } else if card.content == "capsule" {
            Capsule()
                .fill(.green)
        }
    }
    
    private func angle(for degrees: Double) -> Angle {
        Angle.degrees(degrees * 360 - 90)
    }
    
    private func systemFont(for size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * Constants.fontScaleFactor)
    }
    
    // MARK: - Drawing constants
    private struct Constants {
        static let cardCornerRadius: CGFloat = 10
        static let fontScaleFactor = 0.75
        static let percentage = 100
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: ConcentrationGame<String>.Card(isFaceUp: true, isMatched: false, content: "🐙"), gameType: .emojiMojo)
            .foregroundColor(.pink)
            .padding(50)
    }
}
