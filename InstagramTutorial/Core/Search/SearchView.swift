//
//  SearchView.swift
//  InstagramTutorial
//
//  Created by Christopher Walter on 9/5/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing:12) {
                    ForEach(0...15, id: \.self) {
                        user in
                        HStack {
                            Image("hulk1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text("Hulk")
                                    .fontWeight(.semibold)
                                Text("Bruce Banner")
                            }
                            .font(.footnote)
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search...")
            }
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
