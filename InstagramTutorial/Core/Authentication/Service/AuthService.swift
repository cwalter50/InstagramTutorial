//
//  AuthService.swift
//  InstagramTutorial
//
//  Created by Christopher Walter on 9/12/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthService()
    
    init() {
        Task { try await loadUserData() }
    }
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do  {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
        } catch {
            print("DEBUG: Failed logging in user with error: \(error.localizedDescription)")
        }
    }
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("Registered new user: \(result.user.email ?? "")")
            await uploadUserData(uid: result.user.uid, email: email, username: username)
            print("DEBUG: did upload user data...")
        } catch {
            print("DEBUG: failed to register user with error: \(error.localizedDescription)")
        }
    }
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else {return}
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        print("DEBUG: Snapshot data is \(String(describing: snapshot.data()))")
        self.currentUser = try? snapshot.data(as: User.self) // decode data...
    }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil // this is how the app will leave the main tab interface to login interface
        self.currentUser = nil
    }
    
    private func uploadUserData(uid: String, email: String, username: String) async {
        let user = User(id: uid, email: email, username: username)
        self.currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return } // encode data...
        
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
