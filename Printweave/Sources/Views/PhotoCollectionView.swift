//  
//  PhotoCollectionView.swift
//  Printweave
//
//  Created on 09/11/2023.
//
//  Copyright (c) 2023 Jacob King
//  Use of this source code is governed by an MIT-style
//  license that can be found in the LICENSE file or at
//  https://opensource.org/licenses/MIT.
//

import SwiftUI

struct PhotoCollectionView: View {
    
    @StateObject var viewModel: ViewModel

    var body: some View {
        GeometryReader { geometry in
            let itemDimension = 150.0
            let itemDensity = Int(geometry.size.width / itemDimension)
            let gridLayout = [GridItem](repeating: GridItem(.flexible()), count: itemDensity)
            
            ScrollView {
                LazyVGrid(columns: gridLayout, content: {
                    ForEach(viewModel.photos) {
                        PhotoContainer(photo: $0)
                            .padding(.all, 8)
                            .frame(width: itemDimension, height: itemDimension)
                    }
                })
                .padding(16)
            }
        }
        
    }
}

#Preview {
    let vm = PhotoCollectionView.ViewModel()
    let previewImageUrl = Bundle.main.url(forResource: "imgPreviewPhoto", withExtension: "jpg")!
    for _ in 0..<20 {
        let photo = Photo(sourceUrl: previewImageUrl, printSize: .default)
        vm.photos.append(photo)
    }
    return PhotoCollectionView(viewModel: vm)
}
