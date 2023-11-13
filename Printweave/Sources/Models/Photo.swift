//  
//  Photo.swift
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
import SwiftUI

struct Photo: Identifiable, Equatable {
    
    let id = UUID().uuidString
    let sourceUrl: URL
    var customPrintSize: PrintSize? = nil
    
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id
    }
}
