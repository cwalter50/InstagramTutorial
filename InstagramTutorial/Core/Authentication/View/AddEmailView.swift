//
//  AddEmailView.swift
//  InstagramTutorial
//
//  Created by Christopher Walter on 9/6/23.
//

import SwiftUI

struct AddEmailView: View {
//    @State private var email = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack {
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            TextField("Email", text: $viewModel.email)
                .textInputAutocapitalization(.none)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            // next button
            NavigationLink(destination: {
                CreateUserNameView()
                    .navigationBarBackButtonHidden()
            }, label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            })
            .padding(.vertical)
            Spacer()
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
                
            }
        }
    }
}

struct AddEmailView_Previews: PreviewProvider {
//    @StateObject var vm = RegistrationViewModel()
    static var previews: some View {
        AddEmailView()
//            .environmentObject(vm)
    }
}
