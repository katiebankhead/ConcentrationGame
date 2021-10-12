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
                    NavigationLink(themes[0].name, destination: {
                        EmojiGameView(emojiGame: EmojiConcentrationGame())
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
                Section() {
                    NavigationLink("Settings", destination: SettingsView())
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
