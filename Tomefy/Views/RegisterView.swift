//
//  RegisterView.swift
//  Tomefy
//
//  Created by Rizki Ramadhan Wira Saputra on 19/09/25.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject private var viewModel = AuthViewModel()
    
    var body: some View {
        NavigationStack {
            VStack() {
                Text("Tomefy")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .padding(.top, 100)
                
                Text("Register to start your reading adventure!")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 50)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Nickname")
                        .font(.headline)
                        .foregroundColor(.green)
                    
                    TextField("", text: $viewModel.nickname)
                        .padding(13)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                } .padding(.bottom, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Email")
                        .font(.headline)
                        .foregroundColor(.green)
                    
                    TextField("", text: $viewModel.email)
                        .padding(13)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                } .padding(.bottom, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Password")
                        .font(.headline)
                        .foregroundColor(.green)
                    
                    SecureField("", text: $viewModel.password)
                        .padding(13)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                } .padding(.bottom, 20)

                Button(action: {
                    viewModel.Register()
                }) {
                    Text("Register")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .bold()
                        .cornerRadius(8)
                        .padding(.bottom, 30)
                }
                .disabled(viewModel.isLoading)
                .opacity(viewModel.isLoading ? 0.6 : 1.0)
                
                HStack {
                    Text("Already have an account?")
                    
                    NavigationLink(destination: LoginView()) {
                        Text("Login here")
                            .foregroundColor(.green)
                            .navigationBarBackButtonHidden(true)
                    }
                } .padding(.bottom, 200)
                
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                if viewModel.isLoading {
                    ProgressView()
                        .padding()
                }
                
            }
        }
        .padding()
    }
}

#Preview {
    RegisterView()
}
