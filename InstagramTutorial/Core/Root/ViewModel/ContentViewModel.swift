//
//  ContentViewModel.swift
//  InstagramTutorial
//
//  Created by Christopher Walter on 9/12/23.
//

import Foundation
import FirebaseAuth
import Combine

@MainActor
class ContentViewModel: ObservableObject {
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        setupSubscribers()
    }
    
    // this allows us to listen to changes in usersession and currentuser
    func setupSubscribers()
    {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
            print("found a user session")
        }
        .store(in: &cancellables)
        
        service.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
        
    }
}
