//  
//  PrintLayoutHelperTests.swift
//  PrintweaveTests
//
//  Created on 13/11/2023.
//
//  Copyright (c) 2023 Jacob King
//  Use of this source code is governed by an MIT-style
//  license that can be found in the LICENSE file or at
//  https://opensource.org/licenses/MIT.
//

import XCTest
@testable import Printweave

class PrintLayoutHelperTests: XCTestCase {
    
    func testCountOccurancesOfPrintSizeReturnsCorrectCount() {
        let sut = PrintLayoutHelper(layoutParams: LayoutParameters(paperSize: .a4, printSize: .sixByFour, margin: .moderate))
        let photos = (0..<20).map { _ in Photo(sourceUrl: URL(string: "/")!)}
        photos.prefix(upTo: 5).forEach { sut.layoutParams.printSizeOverrides[$0.id] = .sevenByFive }
        let counts = sut.countOccurancesOfPrintSizes(within: photos)
        XCTAssert(counts.count == 2)
        XCTAssert(counts[sut.layoutParams.printSize] == 15)
        XCTAssert(counts[.sevenByFive] == 5)
    }
}
