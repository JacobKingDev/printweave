//  
//  WeaveStatusView.swift
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

struct WeaveStatusView: View {
    
    @State var status: WeaveStatus = .addPhotos
    
    var body: some View {
        HStack {
            Text(status.description)
            Spacer()
            Button("Go!") {
                
            }
            .disabled(status == .addPhotos)
        }
        .padding(8)
    }
}

#Preview {
    WeaveStatusView()
}
