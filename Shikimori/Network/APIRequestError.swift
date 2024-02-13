//
//  APIRequestError.swift
//  Shikimori
//
//  Created by vlapsk1y on 01.12.2023.
//

import Foundation

enum APIRequestError: Swift.Error, Equatable {
    case badUrl, invalidData, message(_ error: String), deauth
}

extension APIRequestError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badUrl:
            return "Bad URL"
        case .invalidData:
            return "Invalid data"
        case .deauth:
            return "Lifetime of access token is expired"
        case .message(let error):
            return error
        }
    }
}
