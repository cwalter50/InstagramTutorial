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
    static func fetchAllUsers() async throws -> [User] {
        var users = [User]()
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let documents = snapshot.documents
        
        for doc in documents {
            print(doc.data())
        }
        
        return users
    }
}
