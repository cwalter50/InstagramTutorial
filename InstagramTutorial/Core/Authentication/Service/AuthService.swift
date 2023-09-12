//
//  AuthService.swift
//  InstagramTutorial
//
//  Created by Christopher Walter on 9/12/23.
//

import Foundation
import FirebaseAuth

class AuthService: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("Registered new user: \(result.user.email ?? "")")
        } catch {
            print("DEBUG: failed to register user with error: \(error.localizedDescription)")
        }
    }
    
    func loadUserData() async throws {
        
    }
    
    func signout() {
        
    }
}
