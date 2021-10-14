//
//  SettingsView.swift
//  ConcentrationHW3
//
//  Created by Katie Bankhead on 10/11/21.
//

import SwiftUI

struct Settings {
    static let highScoreKey = "highScore"
    static let playSoundKey = "soundEnabled"
    static let cardPairsKey = "pairCount"
}

struct SettingsView: View {
    @AppStorage(Settings.playSoundKey) private var playSound = false
    @AppStorage(Settings.cardPairsKey) private var cardPairs: Int = 2

    var body: some View {
        Form {
            Section {
                Toggle("Play Sound", isOn: $playSound).padding(.horizontal)
            }
        }
        .navigationTitle("Settings ⚙️")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
