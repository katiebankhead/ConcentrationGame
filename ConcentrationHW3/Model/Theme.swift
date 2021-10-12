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
    var emojis: [String]
    var color: String // have ViewModel convert to Color
    var numberOfPairsOfCards: Int
}

let themes = [
    Theme(name: "Halloween",
               gameType: .emojiMojo,
               emojis: ["🎃", "👻", "🍭", "🕸", "🧙‍♀️", "🦇", "💀"],
               color: "orange",
               numberOfPairsOfCards: 7
    ),
    Theme(name: "Faces",
               gameType: .emojiMojo,
               emojis: ["🥳", "😂", "🤪", "🤩", "😍", "🙃"],
               color: "yellow",
               numberOfPairsOfCards: 6
    ),
    Theme(name: "Clothing",
               gameType: .emojiMojo,
               emojis: ["🧥", "👔", "🥾", "👗", "🧢", "🧣", "🥿"],
               color: "purple",
               numberOfPairsOfCards: 7
    ),
    Theme(name: "Animals",
               gameType: .emojiMojo,
               emojis: ["🐙", "🐝", "🐼", "🐴", "🐳"],
               color: "brown",
               numberOfPairsOfCards: 5
    ),
    Theme(name: "Nature",
               gameType: .emojiMojo,
               emojis: ["🍁", "✨", "☀️", "🪴", "💐", "❄️", "🌻"],
               color: "green",
               numberOfPairsOfCards: 7
    ),
    Theme(name: "Food",
               gameType: .emojiMojo,
               emojis: ["🎂", "🍩", "🫑", "🫐", "🥐", "🍟", "🍠"],
               color: "orange",
               numberOfPairsOfCards: 7
    )
]
