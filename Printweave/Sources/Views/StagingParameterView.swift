//  
//  StagingParameterView.swift
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

struct StagingParameterView: View {
    
    @EnvironmentObject var rootViewModel: StagingView.ViewModel
    
    var body: some View {
        Form {
            HStack(alignment: .top) {
                VStack(alignment: .trailing) {
                    Picker("Paper Size:", selection: $rootViewModel.layoutParameters.paperSize) {
                        ForEach(PrintSize.allCases, id: \.self) {
                            Text($0.description)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    Picker(selection: $rootViewModel.layoutParameters.margin) {
                        ForEach(Margin.allCases, id: \.self) {
                            Text($0.description)
                        }
                    } label: {
                        Text("Margins:")
                            .padding(.leading, 15) // This is janky, find a better way to do it.
                    }
                    .pickerStyle(.menu)
                }
                
                Picker("Default Print Size:", selection: $rootViewModel.layoutParameters.printSize) {
                    ForEach(PrintSize.allCases, id: \.self) {
                        Text($0.description)
                    }
                }
                .pickerStyle(.menu)
            }
        }
        .padding(8)
    }
}

#Preview {
    StagingParameterView()
}
