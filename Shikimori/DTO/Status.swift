import Foundation

struct Status {
    let id: Int
    let groupedID, name: String
    let size: Int
    let type: TypeEnum

    enum CodingKeys: String, CodingKey {
        case id
        case groupedID = "grouped_id"
        case name, size, type
    }
}

extension Status: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        groupedID = try container.decode(String.self, forKey: .groupedID)
        name = try container.decode(String.self, forKey: .name)
        size = try container.decode(Int.self, forKey: .size)
        type = try container.decode(TypeEnum.self, forKey: .type)
    }
}
