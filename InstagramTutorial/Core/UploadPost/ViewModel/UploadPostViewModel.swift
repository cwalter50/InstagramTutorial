//
//  UploadPostViewModel.swift
//  InstagramTutorial
//
//  Created by Christopher Walter on 9/10/23.
//

import SwiftUI
import PhotosUI
import Firebase

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task  { await loadImage(fromItem: selectedImage) }
        }
    }
    
    @Published var postImage: Image?
    
    private var uiImage: UIImage? // you need an UIImage to post picture to Firebase Storage. This will be used to help with that
    
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
        
    }
    
    func uploadPost(caption: String) async throws {
        print("upload post")
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }
        
        let postRef = Firestore.firestore().collection("posts").document() // this gets a uniqueID.. i think...
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return }
        let post = Post(id: postRef.documentID, ownerUid: uid, caption: caption, likes: 0, imageUrl: imageUrl, timestamp: Timestamp(), user: nil)
        
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        
        try await postRef.setData(encodedPost)
        
        
    }
}
