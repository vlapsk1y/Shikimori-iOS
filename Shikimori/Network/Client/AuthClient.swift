//
//  AuthClient.swift
//  Shikimori
//
//  Created by vlapsk1y on 14.12.2023.
//

import Foundation

class AuthClient: AuthProtocol {
    func token(code: String?, completion: @escaping (Result<Token, APIRequestError>) -> Void) async throws -> Void {
        try await APIRequestDispatcher.request(apiRouter: .token(code: code, grandType: "access_token", refreshToken: nil)) { (result: Result<Token, APIRequestError>) in
            switch result {
            case .success(let success):
                completion(.success(success))
            case .failure(let fail):
                completion(.failure(fail))
            }
        }
    }
    
//    func refreshToken(id: String, secret: String, refresh_token: String) async throws -> Token {
//        let response: Token = try await APIRequestDispatcher.request(apiRouter: .token(code: nil, grandType: "refresh_token", refreshToken: refresh_token))
//        
//        return response
//    }
    
    
}
