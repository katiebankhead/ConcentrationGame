//
//  Theme.swift
//  ConcentrationHW3
//
//  Created by Katie Bankhead on 10/7/21.
//

import Foundation

enum GameType {
    case emojiMojo
    case shapeScape
    case templeMatch
}

struct Theme: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var gameType: GameType
    var content: [String]
    var color: String // have ViewModel convert to Color
    var numberOfPairsOfCards: Int
}

let themes = [
    Theme(name: "Halloween",
               gameType: .emojiMojo,
               content: ["🎃", "👻", "🍭", "🕸", "🧙‍♀️", "🦇", "💀"],
               color: "orange",
               numberOfPairsOfCards: 7
    ),
    Theme(name: "Faces",
               gameType: .emojiMojo,
               content: ["🥳", "😂", "🤪", "🤩", "😍", "🙃" , "🙄"],
               color: "yellow",
               numberOfPairsOfCards: 7
    ),
    Theme(name: "Clothing",
               gameType: .emojiMojo,
               content: ["🧥", "👔", "🥾", "👗", "🧢", "🧣", "🥿"],
               color: "purple",
               numberOfPairsOfCards: 7
    ),
    Theme(name: "Animals",
               gameType: .emojiMojo,
               content: ["🐙", "🐝", "🐼", "🐴", "🐳", "🐢", "🦔"],
               color: "brown",
               numberOfPairsOfCards: 7
    ),
    Theme(name: "Nature",
               gameType: .emojiMojo,
               content: ["🍁", "✨", "☀️", "🪴", "💐", "❄️", "🌻"],
               color: "green",
               numberOfPairsOfCards: 7
    ),
    Theme(name: "Food",
               gameType: .emojiMojo,
               content: ["🎂", "🍩", "🫑", "🫐", "🥐", "🍟", "🍠"],
               color: "blue",
               numberOfPairsOfCards: 7
    )
]
