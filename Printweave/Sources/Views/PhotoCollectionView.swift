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
                        ForEach(rootViewModel.photos) { photo in
                            PhotoContainer(photo: photo)
                                .padding(.all, 8)
                                .frame(width: itemDimension, height: itemDimension)
                                .contextMenu {
                                    Picker("Print Size", selection: $rootViewModel.layoutParameters.printSizeOverrides[photo.id]) {
                                        Text("Inherit")
                                            .tag(Optional<PrintSize>.none)
                                        ForEach(PrintSize.allCases, id: \.self) { printSize in
                                            Text(printSize.description)
                                            .tag(Optional<PrintSize>.some(printSize))
                                        }
                                    }
                                    Button {
                                        self.rootViewModel.photos.removeAll { $0 == photo }
                                    } label: {
                                        Text("Remove")
                                            .foregroundColor(Color.red)
                                    }
                                }
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
