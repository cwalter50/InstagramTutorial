//
//  SearchView.swift
//  InstagramTutorial
//
//  Created by Christopher Walter on 9/5/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing:12) {
                    ForEach(viewModel.users) {
                        user in
                        NavigationLink(value: user) {
                            HStack {
                                Image(systemName: "person.circle")
//                                Image("\(user.profileImageURL ?? "")")
                                    .resizable()
                                    .scaledToFill()
                                    .foregroundColor(Color.gray)
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                VStack(alignment: .leading) {
                                    Text("\(user.username)")
                                        .fontWeight(.semibold)
                                    if let fullName = user.fullName {
                                        Text("\(fullName)")
                                    }
                                    
                                }
                                .font(.footnote)
                                Spacer()
                            }
                            .foregroundColor(.black)
                        }
                        
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search...")
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Explorer")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
