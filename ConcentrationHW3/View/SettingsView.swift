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
    @AppStorage(Settings.playSoundKey) private var playSound: Bool = false
    @State private var cardPairs = UserDefaults.standard.integer(forKey: Settings.cardPairsKey)

    var body: some View {
        Form {
            Section {
                Toggle("Play Sound", isOn: $playSound).padding(.horizontal)
            }
            Section {
                VStack(alignment: .leading) {
                    Text("Number of card pairs")
                    Picker("Number of card pairs", selection: $cardPairs) {
                        Text("2").tag(2)
                        Text("3").tag(3)
                        Text("4").tag(4)
                        Text("5").tag(5)
                        Text("6").tag(6)
                        Text("7").tag(7)
                    }
                    .pickerStyle(WheelPickerStyle())
                }
            }
        }
        .navigationTitle("Settings ⚙️")
        .onAppear {
            cardPairs = UserDefaults.standard.integer(forKey: Settings.cardPairsKey)
        }
        .onDisappear {
            UserDefaults.standard.set(cardPairs, forKey: Settings.cardPairsKey)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
