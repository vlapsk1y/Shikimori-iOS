//
//  AuthorizationModel.swift
//  Shikimori
//
//  Created by vlapsk1y on 08.12.2023.
//

import Foundation
import AuthenticationServices
import Combine

class AuthorizationModel: NSObject, ObservableObject, ASWebAuthenticationPresentationContextProviding {
    typealias ASPresentationAnchor = UIWindow
    var session: ASWebAuthenticationSession? = nil
    
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }
    
    func authInShikimori() {
        session = ASWebAuthenticationSession(url: URL(string: AUTH_URL)!, callbackURLScheme: "shikimoriswift%3A%2Fauth", completionHandler: { callback, error in
            guard error == nil, let success = callback else { return }
            let code = NSURLComponents(string: (success.absoluteString))?.queryItems?.filter({ $0.name == "code" }).first
            
            Task.init {
                do {
                    let token = try await AuthClient().token(code: code?.value)
                    print(token.accessToken!)
                } catch {
                    print(error)
                }
            }
        })
        session?.presentationContextProvider = self
        session?.start()
    }
    
    private func getToken(token: Token) async {
        
    }
    
    private var defaults = UserDefaults.standard
    func isLogged() -> Bool {
        defaults.bool(forKey: "islogged")
    }
    
    private func setToken(access: String, refresh: String) -> Void {
        defaults.set(access, forKey: "access_token")
        defaults.set(refresh, forKey: "refresh_token")
        defaults.set(true, forKey: "islogged")
    }
    
    func deuath() -> Void {
        defaults.removeObject(forKey: "access_token")
        defaults.removeObject(forKey: "refresh_token")
        defaults.removeObject(forKey: "islogged")
    }
    
}
