//
//  Theme.swift
//  ConcentrationHW3
//
//  Created by Katie Bankhead on 10/7/21.
//

import Foundation

enum GameType: CaseIterable {
    case emojiMojo
    case shapeScape
    case templeMatch
}

struct Theme: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var gameType: GameType
    var content: [String]
    var color: String
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
    ),
    Theme(name: "Utah Temples",
               gameType: .templeMatch,
               content: ["bountiful_temple_lds",
                         "cedar_city_temple",
                         "draper_temple",
                         "logan_temple",
                         "manti_temple",
                         "mount_timpanogos_temple",
                         "provo_city_center_temple",
                         "salt_lake_temple",
                         "saratoga_springs_temple",
                         "st_george_temple",
                         "taylorsville_temple",
                         "payson_utah"],
               color: "red",
               numberOfPairsOfCards: 12
    ),
    Theme(name: "Asia Temples",
               gameType: .templeMatch,
               content: ["alabang_temple",
                         "bangkok_temple",
                         "cebu_city_temple",
                         "manila_temple",
                         "okinawa_temple",
                         "urdaneta_temple",
                         "bengaluru_temple"],
               color: "pink",
               numberOfPairsOfCards: 7
    ),
    Theme(name: "Other Temples",
               gameType: .templeMatch,
               content: ["antofagasta_temple",
                         "brasilia_temple",
                         "kinshasa_temple",
                         "laie_temple",
                         "mesa_temple",
                         "nauvoo_temple",
                         "draper_temple"],
               color: "mint",
               numberOfPairsOfCards: 7
    ),
    Theme(name: "Shapes",
          gameType: .shapeScape,
          content: ["triangle",
                    "circle",
                    "rectangle",
                    "capsule"],
          color: "cyan",
          numberOfPairsOfCards: 3
         )
]
