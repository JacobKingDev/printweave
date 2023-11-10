//  
//  WeaveStatus.swift
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

enum WeaveStatus: CustomStringConvertible, Equatable {
    case addPhotos
    case readyToWeave(photoCount: Int)
    case done
    
    var description: String {
        switch self {
        case .addPhotos: return "Add photos by dragging them into the staging view above."
        case let .readyToWeave(photoCount): return "Ready to weave \(photoCount) photo\(photoCount == 1 ? "" : "s")."
        case .done: return "Done! View a preview of the printed photos in the other window."
        }
    }
}
