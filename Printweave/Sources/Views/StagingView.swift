//  
//  StagingView.swift
//  Printweave
//
//  Created on 10/11/2023.
//
//  Copyright (c) 2023 Jacob King
//  Use of this source code is governed by an MIT-style
//  license that can be found in the LICENSE file or at
//  https://opensource.org/licenses/MIT.
//

import SwiftUI

struct StagingView: View {
    
    var photos: [Photo] = {
        var it = [Photo]()
        let previewImageUrl = Bundle.main.url(forResource: "imgPreviewPhoto", withExtension: "jpg")!
        for i in 0..<20 {
            it.append(Photo(sourceUrl: previewImageUrl, printSize: .default))
        }
        return it
    }()
    
    var body: some View {
        VStack {
            DefaultParameterView()
                .padding([.leading, .trailing, .top], 8)
            Divider()
            PhotoCollectionView(viewModel: PhotoCollectionView.ViewModel(photos: photos))
            Divider()
            WeaveStatusView()
                .padding([.leading, .trailing, .bottom], 8)
        }
    }
}

#Preview {
    StagingView()
}
