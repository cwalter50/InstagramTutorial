//
//  PostGridView.swift
//  InstagramTutorial
//
//  Created by Christopher Walter on 9/10/23.
//
// test comment

import SwiftUI

struct PostGridView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    var posts: [Post]
    
    var body: some View {
        // post grid view
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach( posts) {
                post in
                Image("\(post.imageUrl)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(posts: Post.MOCK_POSTS)
    }
}
