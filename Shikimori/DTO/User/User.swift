import Foundation

struct User {
    let id: Int
    let nickname, avatar: String
    let image: UserImage
    let lastOnlineAt: String?
    let url: String
    let name: String?
    let sex: String?
    let fullYears: Int?
    let lastOnline: String?
    let website: String?
    let banned: Bool?
    let about, aboutHTML: String?
    let commonInfo: [String]?
    let showComments: Bool?
    let inFriends: Bool?
    let isIgnored: Bool?
    let stats: Stats?
    let styleID: Int?

    enum CodingKeys: String, CodingKey {
        case id, nickname, avatar, image
        case lastOnlineAt = "last_online_at"
        case url, name, sex
        case fullYears = "full_years"
        case lastOnline = "last_online"
        case website, location, banned, about
        case aboutHTML = "about_html"
        case commonInfo = "common_info"
        case showComments = "show_comments"
        case inFriends = "in_friends"
        case isIgnored = "is_ignored"
        case stats
        case styleID = "style_id"
    }
}

extension User: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        nickname = try container.decode(String.self, forKey: .nickname)
        avatar = try container.decode(String.self, forKey: .avatar)
        image = try container.decode(UserImage.self, forKey: .image)
        lastOnlineAt = try? container.decode(String.self, forKey: .lastOnlineAt)
        url = try container.decode(String.self, forKey: .url)
        name = try? container.decode(String.self, forKey: .name)
        sex = try? container.decodeIfPresent(String.self, forKey: .sex)
        fullYears = try? container.decodeIfPresent(Int.self, forKey: .fullYears)
        lastOnline = try? container.decode(String.self, forKey: .lastOnline)
        website = try? container.decodeIfPresent(String.self, forKey: .website)
        banned = try? container.decode(Bool.self, forKey: .banned)
        about = try? container.decodeIfPresent(String.self, forKey: .about)
        aboutHTML = try? container.decodeIfPresent(String.self, forKey: .aboutHTML)
        commonInfo = try? container.decode([String].self, forKey: .commonInfo)
        showComments = try? container.decode(Bool.self, forKey: .showComments)
        inFriends = try? container.decode(Bool.self, forKey: .inFriends)
        isIgnored = try? container.decode(Bool.self, forKey: .isIgnored)
        stats = try? container.decode(Stats.self, forKey: .stats)
        styleID = try? container.decodeIfPresent(Int.self, forKey: .styleID)
    }
}
