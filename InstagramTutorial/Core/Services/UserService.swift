//
//  UserService.swift
//  InstagramTutorial
//
//  Created by Christopher Walter on 9/14/23.
//

import Foundation
import SwiftUI
import Firebase

struct UserService {
    @MainActor
    static func fetchAllUsers() async throws -> [User] {
        // This works perfect and does exactly what we want... Teacher is going to show a more elegant way to do the same thing.
//        var users = [User]()
//        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
//        let documents = snapshot.documents
//
//        for doc in documents {
//            print(doc.data())
//            guard let user = try? doc.data(as: User.self) else { return users }
//            users.append(user)
//        }
//
//        return users
        
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
        
    }
    
    static func fetchUser(withUid uid: String) async throws -> User {

        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
//        print("DEBUG: Snapshot data is \(String(describing: snapshot.data()))")
        return try snapshot.data(as: User.self) // decode data...
    }
    
}
