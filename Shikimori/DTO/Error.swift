//
//  Error.swift
//  Shikimori
//
//  Created by vlapsk1y on 30.11.2023.
//

import Foundation

struct ErrorAPI {
    var error: String
    var description: String

    enum CodingKeys: String, CodingKey {
        case error
        case description = "error_description"
    }
}

extension ErrorAPI: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        error = try values.decode(String.self, forKey: .error)
        description = try values.decode(String.self, forKey: .description)
    }
}
