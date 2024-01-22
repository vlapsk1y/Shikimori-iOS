//
//  TokenManagment.swift
//  Shikimori
//
//  Created by vlapsk1y on 22.01.2024.
//

import Foundation

class AuthManager {
    static let shared: AuthManager = {
        let instance = AuthManager()
        
        return instance
    }()
    
    var isLogged: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "islogged")
        }
    }
}
