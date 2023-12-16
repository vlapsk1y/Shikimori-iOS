//
//  AuthClient.swift
//  Shikimori
//
//  Created by vlapsk1y on 14.12.2023.
//

import Foundation

class AuthClient: AuthProtocol {
    func token(code: String?) async throws -> Token {
        let response: Token = try await APIRequestDispatcher.request(apiRouter: .token(code: code, grandType: "authorization_code", refreshToken: nil))
        
        return response
    }
    
    func refreshToken(id: String, secret: String, refresh_token: String) async throws -> Token {
        let response: Token = try await APIRequestDispatcher.request(apiRouter: .token(code: nil, grandType: "refresh_token", refreshToken: refresh_token))
        
        return response
    }
    
    
}
