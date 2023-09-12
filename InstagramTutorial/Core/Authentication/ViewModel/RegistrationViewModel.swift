//
//  RegistrationViewModel.swift
//  InstagramTutorial
//
//  Created by Christopher Walter on 9/12/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    
    func createUser() async throws{
        try await AuthService.shared.createUser(email: email, password: password, username: username)
    }
    
}
