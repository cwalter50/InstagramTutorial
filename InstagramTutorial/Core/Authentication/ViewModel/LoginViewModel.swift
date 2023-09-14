//
//  LoginViewModel.swift
//  InstagramTutorial
//
//  Created by Christopher Walter on 9/14/23.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
