//
//  User.swift
//  InstagramTutorial
//
//  Created by Christopher Walter on 9/6/23.
//

import Foundation
import Firebase

struct User: Identifiable, Codable, Hashable {
    let id: String
    let email: String
    var username: String
    var profileImageURL: String?
    var fullName: String?
    var bio: String?
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}


extension User {
    static var MOCK_USERS: [User] = [
        .init(id: UUID().uuidString, email: "panther@gmail.com", username: "panther", profileImageURL: nil, fullName: "Chadwick Boseman", bio: "Wakanda Forever"),
        .init(id: UUID().uuidString, email: "hulk@gmail.com", username: "hulk", profileImageURL: nil, fullName: "Bruce Banner", bio: "Smash"),
        .init(id: UUID().uuidString, email: "spiderman@gmail.com", username: "spiderman", profileImageURL: nil, fullName: "Peter Parker", bio: "I love insects"),
        .init(id: UUID().uuidString, email: "ironman@gmail.com", username: "ironman", profileImageURL: nil, fullName: "Tony Stark", bio: "Billionaire, playboy"),
        
    ]
}
