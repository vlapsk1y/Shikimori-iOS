//
//  APIRequestError.swift
//  Shikimori
//
//  Created by vlapsk1y on 01.12.2023.
//

import Foundation

enum APIRequestError: Swift.Error {
    case badUrl, invalidData, message(_ error: String)
}

extension APIRequestError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badUrl:
            return "Bad URL"
        case .invalidData:
            return "Invalid data"
        case .message(let error):
            return error
        }
    }
}
