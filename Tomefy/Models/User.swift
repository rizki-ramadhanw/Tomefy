//
//  User.swift
//  Tomefy
//
//  Created by Rizki Ramadhan Wira Saputra on 18/09/25.
//

import Foundation

struct User: Codable {
    let userID: String = UUID().uuidString
    let email: String
    let password: String
    let nickname: String
}
