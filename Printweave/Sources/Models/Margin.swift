//  
//  Margin.swift
//  Printweave
//
//  Created on 10/11/2023.
//
//  Copyright (c) 2023 Jacob King
//  Use of this source code is governed by an MIT-style
//  license that can be found in the LICENSE file or at
//  https://opensource.org/licenses/MIT.
//

import Foundation

/// Enumeration representing a concrete number of margin varieties that can be applied in the layout engine to facilitate printers who require a safe-area and are incapable of borderless printing.
/// Values are represented as millimeters.
enum Margin: Int, ExpressibleByStringLiteral, CustomStringConvertible, CaseIterable {
    case none = 0
    case narrow = 4
    case moderate = 8
    case wide = 12
    
    init(stringLiteral value: String) {
        switch value {
        case "None": self = .none
        case "Narrow": self = .narrow
        case "Moderate": self = .moderate
        case "Wide": self = .wide
        default: self = .moderate
        }
    }
    
    var description: String {
        switch self {
        case .none: return "None"
        case .narrow: return "Narrow"
        case .moderate: return "Moderate"
        case .wide: return "Wide"
        }
    }
}
