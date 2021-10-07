//
//  GameMenuView.swift
//  ConcentrationHW3
//
//  Created by Katie Bankhead on 10/6/21.
//

import SwiftUI

// move to model Themes file
enum GameType {
    case emojiMojo
    case shapeScape
    case templeMatch
}

struct Theme {
    var name: String
    var gameType: GameType
    var emojis: [String]
    var color: Color
    var numberOfPairsOfCards: Int
}

let themes = [
    Theme(name: "Halloween",
               gameType: .emojiMojo,
               emojis: ["🎃", "👻", "🍭", "🕸", "🧙‍♀️", "🦇", "💀"],
               color: .orange,
               numberOfPairsOfCards: 7
    )
]

struct GameMenuView: View {
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Games")) {
                    NavigationLink(themes[0].name, destination: {
                        Circle().fill(.red)
                            .padding()
                    })
                    NavigationLink("Shape Scape", destination: {
                        Circle().fill(.green)
                            .padding()
                    })
                    NavigationLink("Temple Run", destination: {
                        Circle().fill(.blue)
                            .padding()
                    })
                }
            }
            .navigationTitle("Project 1")
        }
    }
}

struct GameMenuView_Previews: PreviewProvider {
    static var previews: some View {
        GameMenuView()
    }
}
