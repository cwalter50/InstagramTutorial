//
//  EditProfileViewModel.swift
//  InstagramTutorial
//
//  Created by Christopher Walter on 9/21/23.
//

//import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task  { await loadImage(fromItem: selectedImage) }
        }
    }
    
    @Published var profileImage: Image?
    @Published var fullname = ""
    @Published var bio = ""
    
    init(user: User) {
        self.user = user
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
        
    }
    
    func updateUserData() async throws {
        // update profile image if changed
        
        var data = [String: Any]()
        // update name if changed
        if !fullname.isEmpty && user.fullName != fullname {
            print("DEBUG: Update fullname \(fullname)")
            user.fullName = fullname
            data["fullName"] = fullname
        }
        // update bio if changed
        if !bio.isEmpty && user.bio != bio {
            print("DEBUG: update bio \(bio)")
            user.bio = bio
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
        
        
    }
}
