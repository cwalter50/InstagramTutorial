//
//  CircularProfileImageView.swift
//  InstagramTutorial
//
//  Created by Christopher Walter on 9/24/23.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
        case .xSmall:
            return 40
        case .small:
            return 48
        case .medium:
            return 64
        case .large:
            return 80
        }
    }
    
}

struct CircularProfileImageView: View {
    let user: User
    let size: ProfileImageSize
    var body: some View {
        if let imageURL = user.profileImageURL {
            KFImage(URL(string: imageURL))
                .resizable()
                .frame(width:size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
                .foregroundColor(Color(uiColor: .systemGray4))
        }

    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user: User.MOCK_USERS[0], size: .large)
    }
}
