//
//  Post.swift
//  InstagramTutorial
//
//  Created by Christopher Walter on 9/7/23.
//

import Foundation


struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    let user: User?
}


extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: UUID().uuidString, ownerUid: User.MOCK_USERS[0].id, caption: "Hello world", likes: 106, imageUrl: "blackpanther1", timestamp: Date(), user: User.MOCK_USERS[0]),
        .init(id: UUID().uuidString, ownerUid: User.MOCK_USERS[0].id, caption: "Wakanda Forever", likes: 54, imageUrl: "blackpanther2", timestamp: Date(), user: User.MOCK_USERS[0]),
        .init(id: UUID().uuidString, ownerUid: User.MOCK_USERS[0].id, caption: "Wakanda Forever", likes: 12, imageUrl: "blackpanther3", timestamp: Date(), user: User.MOCK_USERS[0]),
        .init(id: UUID().uuidString, ownerUid: User.MOCK_USERS[0].id, caption: "Wakanda Forever", likes: 7, imageUrl: "blackpanther4", timestamp: Date(), user: User.MOCK_USERS[0]),
        .init(id: UUID().uuidString, ownerUid: User.MOCK_USERS[1].id, caption: "Hulk Smash", likes: 3, imageUrl: "hulk3", timestamp: Date(), user: User.MOCK_USERS[1]),
        .init(id: UUID().uuidString, ownerUid: User.MOCK_USERS[1].id, caption: "Hulk Smash a lot. Also Smart", likes: 86, imageUrl: "hulk1", timestamp: Date(), user: User.MOCK_USERS[1]),
        .init(id: UUID().uuidString, ownerUid: User.MOCK_USERS[2].id, caption: "Just a friendly neighborhood type of guy", likes: 2563, imageUrl: "spiderman1", timestamp: Date(), user: User.MOCK_USERS[2]),
        .init(id: UUID().uuidString, ownerUid: User.MOCK_USERS[2].id, caption: "Just a friendly neighborhood type of guy. a lot of webs", likes: 15, imageUrl: "spiderman3", timestamp: Date(), user: User.MOCK_USERS[2]),
        .init(id: UUID().uuidString, ownerUid: User.MOCK_USERS[3].id, caption: "Iron man", likes: 75, imageUrl: "ironman1", timestamp: Date(), user: User.MOCK_USERS[3]),
        .init(id: UUID().uuidString, ownerUid: User.MOCK_USERS[3].id, caption: "Iron man is back", likes: 347, imageUrl: "ironman2", timestamp: Date(), user: User.MOCK_USERS[3]),
    
    ]
}
