//
//  AuthProtocol.swift
//  Shikimori
//
//  Created by vlapsk1y on 08.12.2023.
//

import Foundation

protocol AuthProtocol {
    func token(code: String?, completion: @escaping (Result<Token, APIRequestError>) -> Void) async throws -> Void
    func refreshToken(refresh_token: String, completion: @escaping (Result<Token, APIRequestError>) -> Void) async throws -> Void
}
