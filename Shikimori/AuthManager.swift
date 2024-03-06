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
    var access_token: String? {
        get {
            return UserDefaults.standard.string(forKey: DEAFULTS_ACCESS_TOKEN)
        }
        set {
            defaults.set(newValue, forKey: DEAFULTS_ACCESS_TOKEN)
        }
    }
    var refresh_token: String {
        get {
            return UserDefaults.standard.string(forKey: DEFAULTS_REFRESH_TOKEN)!
        }
        set {
            defaults.set(newValue, forKey: DEFAULTS_REFRESH_TOKEN)
        }
    }
    
    func updateToken() -> Void {
        if !isLogged { return }
        
        Task {
            do {
                try await AuthClient().refreshToken(refresh_token: refresh_token) {
                    (result: Result<Token, APIRequestError>) in
                    switch result {
                    case .success(let x):
                        print("New token! access_token: \(x.accessToken!), refresh_token: \(x.refreshToken!), timestamp: \(x.expiresIn!)")
                        self.setToken(access: x.accessToken!, refresh: x.refreshToken!)
                    case .failure(_):
                        break
                    }
                }
            }
        }
    }
    
    func setOwnId(id: Int) -> Void {
        defaults.set(id, forKey: "id")
    }
    
    func setLogged() -> Void {
        defaults.set(true, forKey: DEFAULTS_ISLOGGED)
    }
    
    func setToken(access: String, refresh: String) -> Void {
        access_token = access
        refresh_token = refresh
        defaults.set(Int(NSDate().timeIntervalSince1970), forKey: DEFAULTS_TIMESTAMP)
    }
    
    func deauth() -> Void {
        defaults.removeObject(forKey: DEAFULTS_ACCESS_TOKEN)
        defaults.removeObject(forKey: DEFAULTS_TIMESTAMP)
        defaults.removeObject(forKey: "id")
        defaults.set(false, forKey: DEFAULTS_ISLOGGED)
    }
}
