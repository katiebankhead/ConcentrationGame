//
//  ContentView.swift
//  ConcentrationHW3
//
//  Created by Katie Bankhead on 9/8/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            ForEach(0 ..< 4) { index in
                CardView(isFaceUp: true)
            }
        }
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke()
                Text("🧋")
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
        ContentView()
    }
}
