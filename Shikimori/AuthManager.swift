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
        get { return defaults.bool(forKey: DEFAULTS_ISLOGGED) }
        set { defaults.setValue(newValue, forKey: DEFAULTS_ISLOGGED) }
    }
    var accessToken: String? {
        get { return defaults.string(forKey: DEAFULTS_ACCESS_TOKEN) }
        set { defaults.set(newValue, forKey: DEAFULTS_ACCESS_TOKEN) }
    }
    var refreshToken: String {
        get { return defaults.string(forKey: DEFAULTS_REFRESH_TOKEN)! }
        set { defaults.set(newValue, forKey: DEFAULTS_REFRESH_TOKEN) }
    }
    var ownId: Int {
        get { return defaults.integer(forKey: "id") }
    }

    func updateToken() {
        if !isLogged { return }

        Task {
            do {
                try await AuthClient().refreshToken(token: refreshToken) { (result: Result<Token, APIRequestError>) in
                    switch result {
                    case .success(let x):
                        self.setToken(access: x.accessToken!, refresh: x.refreshToken!)
                    case .failure:
                        break
                    }
                }
            }
        }
    }

    func setOwnId(id: Int) { defaults.set(id, forKey: "id") }

    func setLogged() { defaults.set(true, forKey: DEFAULTS_ISLOGGED) }

    func setToken(access: String, refresh: String) {
        accessToken = access
        refreshToken = refresh
        defaults.set(Int(NSDate().timeIntervalSince1970), forKey: DEFAULTS_TIMESTAMP)
    }

    func deauth() {
        defaults.removeObject(forKey: DEAFULTS_ACCESS_TOKEN)
        defaults.removeObject(forKey: DEFAULTS_TIMESTAMP)
        defaults.removeObject(forKey: "id")
        defaults.set(false, forKey: DEFAULTS_ISLOGGED)
    }
}
