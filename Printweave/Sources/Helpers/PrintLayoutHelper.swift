//  
//  PrintLayoutHelper.swift
//  Printweave
//
//  Created on 13/11/2023.
//
//  Copyright (c) 2023 Jacob King
//  Use of this source code is governed by an MIT-style
//  license that can be found in the LICENSE file or at
//  https://opensource.org/licenses/MIT.
//

import Foundation

class PrintLayoutHelper {
    
    var layoutParams: LayoutParameters
    
    init(layoutParams: LayoutParameters) {
        self.layoutParams = layoutParams
    }
    
    func generatePrintLayout(for photos: Photos) {
        let printSizeCounts = countOccurancesOfPrintSizes(within: photos)
    }
    
    func countOccurancesOfPrintSizes(within photos: Photos) -> [PrintSize: Int] {
        photos.reduce(into: [PrintSize: Int]()) { partialResult, photo in
            let printSize = layoutParams.printSizeOverrides[photo.id] ?? layoutParams.printSize
            let currentCount = partialResult[printSize] ?? 0
            partialResult[printSize] = currentCount + 1
        }
    }
}
