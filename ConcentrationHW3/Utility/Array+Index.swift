//
//  Array+Index.swift
//  Array+Index
//
//  Created by Katie Bankhead on 9/9/21.
//

import Foundation

extension Array where Element: Identifiable {
    func index(of targetElement: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == targetElement.id {
                return index
            }
        }
        
        return nil
    }
}
