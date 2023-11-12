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
    
    @EnvironmentObject var rootViewModel: StagingView.ViewModel

    var body: some View {
        if rootViewModel.status == .addPhotos {
            Text("You don't have any photos yet, why not add some?")
        }
        else {
            GeometryReader { geometry in
                let itemDimension = 150.0
                let itemDensity = Int(geometry.size.width / itemDimension)
                let gridLayout = [GridItem](repeating: GridItem(.flexible()), count: itemDensity)
                
                ScrollView {
                    LazyVGrid(columns: gridLayout, content: {
                        ForEach(rootViewModel.photos) {
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
}

#Preview {
    PhotoCollectionView()
}
