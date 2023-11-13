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
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            StagingParameterView()
                .padding([.leading, .trailing, .top], 8)
                .environmentObject(viewModel)
            Divider()
            StagingPhotoListView()
                .frame(minHeight: 300)
                .onDrop(of: ["public.file-url"], delegate: viewModel)
                .environmentObject(viewModel)
            Divider()
            StagingStatusView()
                .padding([.leading, .trailing, .bottom], 8)
                .environmentObject(viewModel)
        }
    }
}

#Preview {
    StagingView()
}
