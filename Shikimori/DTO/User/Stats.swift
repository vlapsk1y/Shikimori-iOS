import Foundation

struct Stats {
    let statuses, fullStatuses, scores, types: FullStatuses
    let ratings: Ratings
    let hasAnime, hasManga: Bool

    enum CodingKeys: String, CodingKey {
        case statuses
        case fullStatuses = "full_statuses"
        case scores, types, ratings
        case hasAnime = "has_anime?"
        case hasManga = "has_manga?"
        case genres, studios, publishers, activity
    }
}

extension Stats: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        statuses = try container.decode(FullStatuses.self, forKey: .statuses)
        fullStatuses = try container.decode(FullStatuses.self, forKey: .fullStatuses)
        scores = try container.decode(FullStatuses.self, forKey: .scores)
        types = try container.decode(FullStatuses.self, forKey: .types)
        ratings = try container.decode(Ratings.self, forKey: .ratings)
        hasAnime = try container.decode(Bool.self, forKey: .hasAnime)
        hasManga = try container.decode(Bool.self, forKey: .hasManga)
    }
}
