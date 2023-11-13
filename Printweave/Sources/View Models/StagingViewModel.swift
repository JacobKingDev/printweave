//  
//  StagingViewModel.swift
//  Printweave
//
//  Created on 12/11/2023.
//
//  Copyright (c) 2023 Jacob King
//  Use of this source code is governed by an MIT-style
//  license that can be found in the LICENSE file or at
//  https://opensource.org/licenses/MIT.
//

import Foundation
import SwiftUI
import Combine

extension StagingView {
    @MainActor final class ViewModel: ObservableObject, DropDelegate {
        
        @Published var photos: [Photo] = []
        @Published var status: WeaveStatus = .addPhotos
        @Published var layoutParameters = LayoutParameters()
        
        var cancellables = Set<AnyCancellable>()
        
        init() {
            // Register observers.
            $photos.sink { newPhotos in
                self.status = newPhotos.isEmpty ? .addPhotos : .readyToWeave(photoCount: newPhotos.count)
            }
            .store(in: &cancellables)
        }
        
        func performDrop(info: DropInfo) -> Bool {
            let providers = info.itemProviders(for: ["public.file-url"])
            providers.forEach { provider in
                Task {
                    guard let urlData = try? await provider.loadItem(forTypeIdentifier: "public.file-url", options: nil) as? Data,
                          let url = URL(dataRepresentation: urlData, relativeTo: nil) else {
                        return // TODO: Propagate error up to userland.
                    }
                    photos.append(Photo(sourceUrl: url))
                }
            }
            return false
        }
    }
}
