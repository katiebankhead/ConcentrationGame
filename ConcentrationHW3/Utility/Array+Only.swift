//
//  Array+Only.swift
//  ConcentrationHW3
//
//  Created by Katie Bankhead on 10/1/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first: nil
    }
}
