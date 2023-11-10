//  
//  PhotoCollectionViewModel.swift
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

extension PhotoCollectionView {
    @MainActor final class ViewModel: ObservableObject {
        
        @Published var photos: [Photo]
        
        init(photos: [Photo] = []) {
            self.photos = photos
        }
        
    }
}
