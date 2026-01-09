//
//  EditProfileViewModel.swift
//  Instagram
//
//  Created by Khawla Zarrami on 09/01/2026.
//

import PhotosUI
import SwiftUI
import Combine

@MainActor
class EditProfileViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
            didSet {
                Task {
                    await loadImage(fromItem: selectedImage)
                }
            }
        }
    
    @Published var profileImage: Image?
    
    @Published var fullname = ""
    @Published var bio = ""
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
}
