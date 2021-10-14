//
//  HighScoreView.swift
//  ConcentrationHW3
//
//  Created by Katie Bankhead on 10/13/21.
//

import SwiftUI

struct HighScoreView: View {
    var body: some View {
        Form {
            Section {
                Text("Overall High Score: \(UserDefaults.standard.integer(forKey: Settings.highScoreKey))")
            }
            ForEach(themes) { theme in
                Section {
                    Text("\(theme.name) High Score: \(UserDefaults.standard.integer(forKey: theme.name))")
                }
            }
        }
        .navigationTitle("High Scores 🏆")
    }
}

struct HighScoreView_Previews: PreviewProvider {
    static var previews: some View {
        HighScoreView()
    }
}
