//
//  CapsuleCountdown.swift
//  ConcentrationHW3
//
//  Created by Katie Bankhead on 10/12/21.
//

import SwiftUI

struct CapsuleCountdown: View {
    var value: Double
    var width: CGFloat
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(width: width, height: 5)
                .foregroundColor(Color(white: 0, opacity: 0.1))
            Capsule()
                .frame(width: width * CGFloat(value), height: 5)
        }
        .opacity(0.8)
        .transition(.identity)
    }
}

struct CapsuleCountdown_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleCountdown(value: 0.667, width: 300)
    }
}
