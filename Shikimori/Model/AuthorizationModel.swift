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
    
    func authInShikimori(completion: @escaping (Bool) -> Void) {
        session = ASWebAuthenticationSession(url: URL(string: AUTH_URL)!, callbackURLScheme: "shikimoriswift%3A%2Fauth", completionHandler: { callback, error in
            guard error == nil, let success = callback else { return }
            let code = NSURLComponents(string: (success.absoluteString))?.queryItems?.filter({ $0.name == "code" }).first
            
            Task {
                do {
                    try await AuthClient().token(code: code?.value) { (result: Result<Token, APIRequestError>) in
                        switch result {
                        case .success(let x):
                            self.getToken(token: x)
                            completion(true)
                        case .failure(let e):
                            self.message = e.localizedDescription
                            self.hasError.toggle()
                            completion(false)
                        }
                    }
                } catch(let error) {
                    print(error)
                    completion(false)
                }
            }
        })
        session?.presentationContextProvider = self
        session?.start()
    }
    
    private func getToken(token: Token) {
        AuthManager.shared.setToken(access: token.accessToken!, refresh: token.refreshToken!)
    }
    
    func isLogged() -> Bool {
        AuthManager.shared.isLogged
    }
}
