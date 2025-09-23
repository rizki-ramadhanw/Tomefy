//
//  AuthViewModel.swift
//  Tomefy
//
//  Created by Rizki Ramadhan Wira Saputra on 18/09/25.
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var nickname: String = ""
    
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    private let userDefaultsKey = "userKey"
    
    func Register() {
        guard !nickname.isEmpty && !email.isEmpty && !password.isEmpty else {
            self.errorMessage = "All fields must be filled"
            return
        }
        
        if UserDefaults.standard.data(forKey: self.userDefaultsKey) != nil {
            self.errorMessage = "Email already registered"
            return
        }
        
        self.isLoading = true
        self.errorMessage = nil
        
        let userData = User(email: self.email, password: self.password, nickname: self.nickname)
        
        do {
            let encodedData = try JSONEncoder().encode(userData)
            
            UserDefaults.standard.set(encodedData, forKey: self.userDefaultsKey)
            
            print("Pendaftaran suskses") // Testing
            
            self.isLoading = false
            
        } catch {
            self.errorMessage = "Failed to register"
            self.isLoading = false
        }
    }
    
    func Login() {
        guard !email.isEmpty && !password.isEmpty else {
            self.errorMessage = "All fields must be filled"
            return
        }
        
        self.isLoading = true
        self.errorMessage = nil
        
        do {
            guard let encodedData = UserDefaults.standard.data(forKey: self.userDefaultsKey) else {
                self.errorMessage = "User not registered"
                self.isLoading = false
                return
            }
            
            let user = try JSONDecoder().decode(User.self, from: encodedData)
            
            if user.email == self.email && user.password == self.password {
                print("Login berhasil") // Testing
            } else {
                self.errorMessage = "Email or password is wrong"
            }
            
            
        } catch {
            self.errorMessage = "Failed to gather user data"
            self.isLoading = false
        }
    }
}
