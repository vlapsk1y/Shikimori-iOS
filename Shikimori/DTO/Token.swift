//
//  Token.swift
//  Shikimori
//
//  Created by vlapsk1y on 08.12.2023.
//

import Foundation

struct Token {
    let accessToken: String?
    let tokenType: String?
    let expiresIn: Int?
    let refreshToken: String?
    let scope: String?
    let createdAt: Int?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case scope
        case createdAt = "created_at"
    }
}

extension Token: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        accessToken = try container.decode(String.self, forKey: .accessToken)
        tokenType = try container.decode(String.self, forKey: .tokenType)
        expiresIn = try container.decode(Int.self, forKey: .expiresIn)
        refreshToken = try container.decode(String.self, forKey: .refreshToken)
        scope = try container.decode(String.self, forKey: .scope)
        createdAt = try container.decode(Int.self, forKey: .createdAt)
    }
}
