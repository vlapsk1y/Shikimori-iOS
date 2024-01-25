//
//  TokenManagment.swift
//  Shikimori
//
//  Created by vlapsk1y on 22.01.2024.
//

import Foundation

class AuthManager {
    private var defaults = UserDefaults.standard
    static let shared: AuthManager = {
        let instance = AuthManager()
        
        return instance
    }()
    
    var isLogged: Bool {
        get {
            return UserDefaults.standard.bool(forKey: DEFAULTS_ISLOGGED)
        }
    }
    
    func setToken(access: String, refresh: String) -> Void {
        defaults.set(access, forKey: DEAFULTS_ACCESS_TOKEN)
        defaults.set(refresh, forKey: DEFAULTS_REFRESH_TOKEN)
        defaults.set(true, forKey: DEFAULTS_ISLOGGED)
        defaults.set(NSDate().timeIntervalSince1970, forKey: DEFAULTS_TIMESTAMP)
    }
    
    func deuath() -> Void {
        defaults.removeObject(forKey: DEAFULTS_ACCESS_TOKEN)
        defaults.removeObject(forKey: DEFAULTS_REFRESH_TOKEN)
        defaults.removeObject(forKey: DEFAULTS_TIMESTAMP)
        defaults.set(false, forKey: DEFAULTS_ISLOGGED)
    }
}
