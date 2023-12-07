//
//  NameValue.swift
//  Shikimori
//
//  Created by vlapsk1y on 08.12.2023.
//

import Foundation

struct NameValue<X:Decodable, T:Decodable>: Decodable {
    let name: X
    let value: T
    
    enum CodingKeys: String, CodingKey {
        case name, value
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(X.self, forKey: .name)
        value = try container.decode(T.self, forKey: .value)
    }
}
