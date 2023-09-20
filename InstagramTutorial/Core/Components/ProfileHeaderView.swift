//
//  ProfileHeaderView.swift
//  InstagramTutorial
//
//  Created by Christopher Walter on 9/10/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User
    
    var body: some View {
        VStack(spacing: 10) {
            // pic and stats
            HStack {
                Image("\(user.profileImageURL ?? "")")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                Spacer()
                HStack(spacing: 8) {
                    UserStatView(value: 5, title: "Posts")
                    UserStatView(value: 8, title: "Followers")
                    UserStatView(value: 3, title: "Following")
                }
            }
            .padding(.horizontal)
            // name and bio
            VStack(alignment: .leading) {
                if let fullname = user.fullName {
                    Text("\(fullname)")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                if let bio = user.bio {
                    Text("\(bio)")
                        .font(.footnote)
                }
                Text(user.username)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            // action button
            
            Button {
                
            } label: {
                Text(user.isCurrentUser ? "Edit Profile": "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 32)
                    .background(user.isCurrentUser ? .white: Color(.systemBlue))
                    .foregroundColor(user.isCurrentUser ? .black: .white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isCurrentUser ? Color.gray: .clear, lineWidth: 1))
                    .padding(.horizontal)
            }

            Divider()
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USERS[0])
    }
}
