//
//  FeedViewModel.swift
//  InstagramTutorial
//
//  Created by Christopher Walter on 9/27/23.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task {
            try await fetchPosts()
        }
    }
    
    @MainActor
    func fetchPosts() async throws {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        
        // this block does the same thing as the block below....
//        self.posts = try snapshot.documents.compactMap({ document in
//            let post = try document.data(as: Post.self)
//            return post
//        })
        
        self.posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        for i in 0..<posts.count {
            let post = posts[i]
            let ownerUID = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUID)
            posts[i].user = postUser
        }
    }
}
