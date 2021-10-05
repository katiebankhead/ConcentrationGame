//
//  Cardify.swift
//  Cardify
//
//  Created by Katie Bankhead on 9/21/21.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var isFaceUp: Bool { rotation < 90 }
    
    var rotation: Double
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    func body(content: Content) -> some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: Constants.cardCornerRadius)
            if isFaceUp {
                cardShape.fill(Color.white)
                cardShape.stroke()
            } else {
                cardShape
            }
            
            content.opacity(isFaceUp ? 1 : 0)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }
    
    private struct Constants {
        static let cardCornerRadius: CGFloat = 10
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
