//
//  Cardify.swift
//  Cardify
//
//  Created by Katie Bankhead on 9/21/21.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: Constants.cardCornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: Constants.cardCornerRadius).stroke()
                content
            } else {
                RoundedRectangle(cornerRadius: Constants.cardCornerRadius)
            }
        }
        .rotation3DEffect(Angle.degrees(isFaceUp ? 0 : 180), axis: (0, 1, 0))
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
