//
//  SearchViewModel.swift
//  InstagramTutorial
//
//  Created by Christopher Walter on 9/19/23.
//

import Foundation


class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init () {
        Task { try await fetchAllUsers() }
    }
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
