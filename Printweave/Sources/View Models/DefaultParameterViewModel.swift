//  
//  DefaultParameterViewModel.swift
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
import SwiftUI

extension DefaultParameterView {
    @MainActor final class ViewModel: ObservableObject {
        
        @Published var layoutParameters = LayoutParameters()
    }
}
