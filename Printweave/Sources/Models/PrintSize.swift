//  
//  PrintSize.swift
//  Printweave
//
//  Created on 09/11/2023.
//
//  Copyright (c) 2023 Jacob King
//  Use of this source code is governed by an MIT-style
//  license that can be found in the LICENSE file or at
//  https://opensource.org/licenses/MIT.
//

import Foundation

/// A enumeration of common print-format page sizes. A custom case is also exposed, to which dimensions (in millimeters) can be passed.
enum PrintSize: ExpressibleByStringLiteral, CustomStringConvertible, CaseIterable, Hashable {
    
    static var allCases: [PrintSize] = [.a5, .a4, .a3, .letter, .legal, .sixByFour, .sevenByFive, .eightBySix, .tenByEight, .twelveByEight, .twentyBySixteen, .thirtyByTwenty] // Custom case destroys Swift's synthesis of this, so, it's explicit :')
    
    // ISO
    case a5
    case a4
    case a3
    
    // US
    case letter
    case legal
    
    // Photo
    case sixByFour
    case sevenByFive
    case eightBySix
    case tenByEight
    case twelveByEight
    case twentyBySixteen
    case thirtyByTwenty
    
    // Custom
    case custom(width: Double, height: Double)
    
    /// The width of the page, normalised to millimeters.
    var width: Double {
        switch self {
        case .a3: return Self.a4.height
        case .a4: return 210
        case .a5: return Self.a4.height / 2
            
        case .letter, .legal: return inchesToMillimeters(8.5)
            
        case .sixByFour: return inchesToMillimeters(6)
        case .sevenByFive: return inchesToMillimeters(7)
        case .eightBySix: return inchesToMillimeters(8)
        case .tenByEight: return inchesToMillimeters(10)
        case .twelveByEight: return inchesToMillimeters(12)
        case .twentyBySixteen: return inchesToMillimeters(20)
        case .thirtyByTwenty: return inchesToMillimeters(30)
            
        case let .custom(width, _): return width
        }
    }
    
    /// The height of the page, normalised to millimeters.
    var height: Double {
        switch self {
        case .a3: return Self.a4.width * 2
        case .a4: return 297
        case .a5: return Self.a4.width / 2
            
        case .letter: return inchesToMillimeters(11)
        case .legal: return inchesToMillimeters(14)
            
        case .sixByFour: return inchesToMillimeters(4)
        case .sevenByFive: return inchesToMillimeters(5)
        case .eightBySix: return inchesToMillimeters(6)
        case .tenByEight: return inchesToMillimeters(8)
        case .twelveByEight: return inchesToMillimeters(8)
        case .twentyBySixteen: return inchesToMillimeters(16)
        case .thirtyByTwenty: return inchesToMillimeters(20)
            
        case let .custom(_, height): return height
        }
    }
    
    private func inchesToMillimeters(_ inches: Double) -> Double {
        return inches * 25.4
    }
    
    init(stringLiteral value: String) {
        switch value {
        case "A5": self = .a5
        case "A4": self = .a4
        case "A3": self = .a3
        case "Letter": self = .letter
        case "Legal": self = .legal
        case "6x4": self = .sixByFour
        case "7x5": self = .sevenByFive
        case "8x6": self = .eightBySix
        case "10x8": self = .tenByEight
        case "12x8": self = .twelveByEight
        case "20x16": self = .twentyBySixteen
        case "30x20": self = .thirtyByTwenty
        default:
            // Attempt to interpret a custom literal.
            let components = value.components(separatedBy: " x ")
            guard components.count == 2 else {
                // Malformed literal.
                print("Malformed custom print size literal encountered!")
                self = .custom(width: 0, height: 0)
                return
            }
            let widthLiteral = components[0]
            let heightLiteral = components[1]
            
            func normaliseToMillimeters(stringLiteral: String) -> Int? {
                guard stringLiteral.hasSuffix("mm"), let numeric = Int(stringLiteral.replacingOccurrences(of: "mm", with: "")) else {
                    // Malformed literal.
                    print("Malformed custom print size literal encountered!")
                    return nil
                }
                return numeric
            }
            
            guard let normalisedWidth = normaliseToMillimeters(stringLiteral: widthLiteral), let normalisedHeight = normaliseToMillimeters(stringLiteral: heightLiteral) else {
                print("Malformed custom print size literal encountered!")
                self = .custom(width: 0, height: 0)
                return
            }
            self = .custom(width: Double(normalisedWidth), height: Double(normalisedHeight))
        }
    }
    
    var description: String {
        switch self {
        case .a5: return "A5"
        case .a4: return "A4"
        case .a3: return "A3"
        case .letter: return "Letter"
        case .legal: return "Legal"
        case .sixByFour: return "6x4"
        case .sevenByFive: return "7x5"
        case .eightBySix: return "8x6"
        case .tenByEight: return "10x8"
        case .twelveByEight: return "12x8"
        case .twentyBySixteen: return "20x16"
        case .thirtyByTwenty: return "30x20"
        case let .custom(width, height): return "\(width)mm x \(height)mm"
        }
    }
}
