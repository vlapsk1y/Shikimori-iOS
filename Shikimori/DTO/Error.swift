//
//  Error.swift
//  Shikimori
//
//  Created by vlapsk1y on 30.11.2023.
//

import Foundation

struct Error: Codable {
    var error: String
    var description: String
    
    public init(error: String, description: String) {
            self.error = error
            self.description = description
        }
        
        enum CodingKeys: String, CodingKey {
            case error = "error"
            case description = "error_description"
        }
}
