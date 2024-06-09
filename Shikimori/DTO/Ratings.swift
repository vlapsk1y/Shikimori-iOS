import Foundation

struct Ratings {
    let anime: [NameValue<String, Int>]

    enum CodingKeys: String, CodingKey {
        case anime
    }
}

extension Ratings: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        anime = try container.decode([NameValue<String, Int>].self, forKey: .anime)
    }
}
