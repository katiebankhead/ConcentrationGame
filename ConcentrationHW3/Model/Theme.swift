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
               content: ["๐", "๐ป", "๐ญ", "๐ธ", "๐งโโ๏ธ", "๐ฆ", "๐"],
               color: "orange",
               numberOfPairsOfCards: 7
    ),
    Theme(name: "Faces",
               gameType: .emojiMojo,
               content: ["๐ฅณ", "๐", "๐คช", "๐คฉ", "๐", "๐" , "๐"],
               color: "yellow",
               numberOfPairsOfCards: 7
    ),
    Theme(name: "Clothing",
               gameType: .emojiMojo,
               content: ["๐งฅ", "๐", "๐ฅพ", "๐", "๐งข", "๐งฃ", "๐ฅฟ"],
               color: "purple",
               numberOfPairsOfCards: 7
    ),
    Theme(name: "Animals",
               gameType: .emojiMojo,
               content: ["๐", "๐", "๐ผ", "๐ด", "๐ณ", "๐ข", "๐ฆ"],
               color: "brown",
               numberOfPairsOfCards: 7
    ),
    Theme(name: "Nature",
               gameType: .emojiMojo,
               content: ["๐", "โจ", "โ๏ธ", "๐ชด", "๐", "โ๏ธ", "๐ป"],
               color: "green",
               numberOfPairsOfCards: 7
    ),
    Theme(name: "Food",
               gameType: .emojiMojo,
               content: ["๐", "๐ฉ", "๐ซ", "๐ซ", "๐ฅ", "๐", "๐ "],
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
