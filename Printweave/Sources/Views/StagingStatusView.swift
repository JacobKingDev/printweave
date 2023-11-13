//  
//  StagingStatusView.swift
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

struct StagingStatusView: View {
    
    @EnvironmentObject var rootViewModel: StagingView.ViewModel
    
    var body: some View {
        HStack {
            Text(rootViewModel.status.description)
            Spacer()
            Button("Go!") {
                
            }
            .disabled(rootViewModel.status == .addPhotos)
        }
        .padding(8)
    }
}

#Preview {
    StagingStatusView()
}
