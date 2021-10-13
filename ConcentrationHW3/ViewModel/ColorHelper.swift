//
//  ColorHelper.swift
//  ConcentrationHW3
//
//  Created by Katie Bankhead on 10/12/21.
//

import SwiftUI

struct ColorHelper {
    static func color(for colorString: String) -> Color {
        switch colorString {
            case "orange":
                return .orange
            case "yellow":
                return .yellow
            case "green":
                return .green
            case "blue":
                return .blue
            case "purple":
                return .purple
            case "brown":
                return .brown
            default:
                return .black
        }
    }
}
