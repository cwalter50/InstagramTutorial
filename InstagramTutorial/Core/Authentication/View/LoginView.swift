//
//  LoginView.swift
//  InstagramTutorial
//
//  Created by Christopher Walter on 9/5/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                // logo image
                Image("instagramlogoblack")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 100)
                // textfields
                VStack {
                    TextField("Enter your email", text: $email)
                        .textInputAutocapitalization(.none)
                        .modifier(IGTextFieldModifier())
                    SecureField("Enter your password", text: $password)
                        .modifier(IGTextFieldModifier())
                }
                // forgot password button
                Button {
                    print("show forgot password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                // login button
                Button {
                    print("login")
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(8)
                }
                .padding(.vertical)
                
                // login with facebook
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    Text("OR")
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                }
                .foregroundColor(.gray)
                
                HStack {
                    Image("facebooklogo")
                        .resizable()
                        .frame(width: 20, height:20)
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                }
                .padding(.top, 8)
                
                Spacer()
                Divider()
                NavigationLink(destination:
                                AddEmailView()
                    .navigationBarBackButtonHidden()
                ) {
                    HStack{
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical, 16)


            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
