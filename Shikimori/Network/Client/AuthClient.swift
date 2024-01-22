//
//  AuthClient.swift
//  Shikimori
//
//  Created by vlapsk1y on 14.12.2023.
//

import Foundation

class AuthClient: AuthProtocol {
    func token(code: String?, completion: @escaping (Result<Token, APIRequestError>) -> Void) async throws -> Void {
        try await APIRequestDispatcher.request(apiRouter: .token(code: code, grandType: "authorization_code", refreshToken: nil)) { (result: Result<Token, APIRequestError>) in
            switch result {
            case .success(let success):
                completion(.success(success))
            case .failure(let fail):
                completion(.failure(fail))
            }
        }
    }
    
    func refreshToken(id: String, secret: String, refresh_token: String, completion: @escaping (Result<Token, APIRequestError>) -> Void) async throws -> Void {
        try await APIRequestDispatcher.request(apiRouter: .token(code: nil, grandType: "refresh_token", refreshToken: refresh_token)) { (result: Result<Token, APIRequestError>) in
            switch result {
            case .success(let x):
                completion(.success(x))
            case .failure(let e):
                completion(.failure(e))
            }
            
        }
    }
    
    
}
