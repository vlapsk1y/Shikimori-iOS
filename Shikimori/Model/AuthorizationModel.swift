//
//  AuthorizationModel.swift
//  Shikimori
//
//  Created by vlapsk1y on 08.12.2023.
//

import Foundation
import AuthenticationServices
import Combine
import SwiftUI

class AuthorizationModel: NSObject, ObservableObject, ASWebAuthenticationPresentationContextProviding {
    typealias ASPresentationAnchor = UIWindow
    var session: ASWebAuthenticationSession? = nil
    @Published var hasError: Bool = false
    var message: String = String()

    
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }
    
    func authInShikimori() -> Void {
        session = ASWebAuthenticationSession(url: URL(string: AUTH_URL)!, callbackURLScheme: "shikimoriswift%3A%2Fauth", completionHandler: { callback, error in
            guard error == nil, let success = callback else { return }
            let code = NSURLComponents(string: (success.absoluteString))?.queryItems?.filter({ $0.name == "code" }).first
            
            Task {
                do {
                    try await AuthClient().token(code: code?.value) { (result: Result<Token, APIRequestError>) in
                        switch result {
                        case .success(let x):
                            self.getToken(token: x)
                        case .failure(let e):
                            self.message = e.localizedDescription
                            self.hasError.toggle()
                        }
                    }
                } catch(let error) {
                    print(error)
                }
            }
        })
        session?.presentationContextProvider = self
        session?.start()
    }
    
    private func getToken(token: Token) {
        setToken(access: token.accessToken!, refresh: token.refreshToken!)
    }
    
    private var defaults = UserDefaults.standard
    func isLogged() -> Bool {
        AuthManager.shared.isLogged
    }
    
    private func setToken(access: String, refresh: String) -> Void {
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
