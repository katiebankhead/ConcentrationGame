//
//  SettingsView.swift
//  ConcentrationHW3
//
//  Created by Katie Bankhead on 10/11/21.
//

import SwiftUI

struct Settings {
    static let playSoundKey = "soundEnabled"
}

struct SettingsView: View {
    @AppStorage(Settings.playSoundKey) private var playSound = false

    var body: some View {
        Form {
            Section {
                Toggle("Play Sound", isOn: $playSound).padding(.horizontal)
            }
        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
