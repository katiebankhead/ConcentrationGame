//
//  GameMenuView.swift
//  ConcentrationHW3
//
//  Created by Katie Bankhead on 10/6/21.
//

import SwiftUI

struct GameMenuView: View {
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Games")) {
                    ForEach(themes.indices) { index in
                        NavigationLink(themes[index].name, destination: {
                            EmojiGameView(emojiGame: EmojiConcentrationGame(themes[index]))
                        })
                    }
                }
                Section() {
                    NavigationLink("Settings", destination: SettingsView())
                }
                Section() {
                    NavigationLink("High Scores", destination: SettingsView())
                }
            }
            .navigationTitle("Concentration Game")
        }
    }
}

struct GameMenuView_Previews: PreviewProvider {
    static var previews: some View {
        GameMenuView()
    }
}
