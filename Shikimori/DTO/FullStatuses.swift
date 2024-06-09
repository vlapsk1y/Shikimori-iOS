import Foundation

struct FullStatuses {
    let anime, manga: [Status]

    enum CodingKeys: String, CodingKey {
        case anime, manga
    }
}

extension FullStatuses: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        anime = try container.decode([Status].self, forKey: .anime)
        manga = try container.decode([Status].self, forKey: .manga)
    }
}
