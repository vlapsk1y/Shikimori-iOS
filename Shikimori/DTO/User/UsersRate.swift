//
//  UsersRate.swift
//  Shikimori
//
//  Created by vlapsk1y on 03.03.2024.
//

import Foundation

struct UsersRate: Decodable, Identifiable {
    let id: Int
    let score: Int
    let status: String
    let text: String?
    let episodes: Int
    let chapters: Int?
    let volumes: Int?
    let text_html: String?
    let rewatches: Int?
    let created_at: String
    let updated_at: String
    let user: User
    let anime: Anime?
    let manga: Manga?
}
