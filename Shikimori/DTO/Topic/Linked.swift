//
//  Linked.swift
//  Shikimori
//
//  Created by vlapsk1y on 03.02.2024.
//

import Foundation

struct Linked: Decodable {
    let id: Int
    let name, russian: String
    let image: UserImage
    let url, kind, score, status: String
    let episodes, episodesAired: Int
    let airedOn, releasedOn: Int

    enum CodingKeys: String, CodingKey {
        case id, name, russian, image, url, kind, score, status, episodes
        case episodesAired = "episodes_aired"
        case airedOn = "aired_on"
        case releasedOn = "released_on"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.russian = try container.decode(String.self, forKey: .russian)
        self.image = try container.decode(UserImage.self, forKey: .image)
        self.url = try container.decode(String.self, forKey: .url)
        self.kind = try container.decode(String.self, forKey: .kind)
        self.score = try container.decode(String.self, forKey: .score)
        self.status = try container.decode(String.self, forKey: .status)
        self.episodes = try container.decode(Int.self, forKey: .episodes)
        self.episodesAired = try container.decode(Int.self, forKey: .episodesAired)
        self.airedOn = try container.decode(Int.self, forKey: .airedOn)
        self.releasedOn = try container.decode(Int.self, forKey: .releasedOn)
    }
}
