//
//  LoginView.swift
//  Tomefy
//
//  Created by Rizki Ramadhan Wira Saputra on 18/09/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = AuthViewModel()
    
    var body: some View {
        
        NavigationStack {
            VStack() {
                Text("Tomefy")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .padding(.top, 100)
                
                Text("Welcome back!")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Log in to continue your reading journey")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 50)
                
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
                    viewModel.Login()
                }) {
                    Text("Login")
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
                    Text("Didn't have an account?")
                    
                    NavigationLink(destination: RegisterView()) {
                        Text("Register here")
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
    LoginView()
}
