//  
//  PhotoContainer.swift
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

struct PhotoContainer: View {
    
    var photo: Photo
    
    var body: some View {
        AsyncImage(url: photo.sourceUrl) { image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    let previewImageUrl = Bundle.main.url(forResource: "imgPreviewPhoto", withExtension: "jpg")!
    let photo = Photo(sourceUrl: previewImageUrl, printSize: .default)
    return PhotoContainer(photo: photo)
}
