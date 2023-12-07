//
//  UserImage.swift
//  Shikimori
//
//  Created by vlapsk1y on 02.12.2023.
//

import Foundation

struct UserImage {
    var x160: String
    var x148: String
    var x80: String
    var x64: String
    var x48: String
    var x32: String
    var x16: String
    
    enum CodingKeys: String, CodingKey {
        case x160, x148, x80, x64, x48, x32, x16
    }
}

extension UserImage: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        x160 = try values.decode(String.self, forKey: .x160)
        x148 = try values.decode(String.self, forKey: .x148)
        x80 = try values.decode(String.self, forKey: .x80)
        x64 = try values.decode(String.self, forKey: .x64)
        x48 = try values.decode(String.self, forKey: .x48)
        x32 = try values.decode(String.self, forKey: .x32)
        x16 = try values.decode(String.self, forKey: .x16)
    }
}
