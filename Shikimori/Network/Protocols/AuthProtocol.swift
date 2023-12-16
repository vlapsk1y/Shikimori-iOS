//
//  AuthProtocol.swift
//  Shikimori
//
//  Created by vlapsk1y on 08.12.2023.
//

import Foundation

protocol AuthProtocol {
    func token(code: String?) async throws -> Token
    func refreshToken(id: String, secret: String, refresh_token: String) async throws -> Token
}
