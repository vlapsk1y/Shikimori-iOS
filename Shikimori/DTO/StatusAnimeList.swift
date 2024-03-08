//
//  StatusAnimeList.swift
//  Shikimori
//
//  Created by vlapsk1y on 03.03.2024.
//

import Foundation

enum StatusAnimeList: String {
    case planned, watching, rewatching, completed, on_hold, dropped, none
    
    init(fromRawValue: String) {
        self = StatusAnimeList(rawValue: fromRawValue) ?? .none
    }
    
    var readable: String {
        switch self {
        case .planned:
            return "Запланировано"
        case .watching:
            return "Смотрю"
        case .rewatching:
            return "Пересматриваю"
        case .completed:
            return "Просмотрено"
        case .on_hold:
            return "Отложено"
        case .dropped:
            return "Брошено"
        case .none:
            return "Неизвестно"
        }
    }
}
