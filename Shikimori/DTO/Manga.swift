//
//  Manga.swift
//  Shikimori
//
//  Created by vlapsk1y on 03.03.2024.
//

import Foundation

struct Manga: Codable {
    let id: Int
    let name: String
    let russian: String?
    let image: UserImage?
    let url: String
    let kind: String
    let score: String
    let status: String
    let volumes: Int
    let chapters: Int
    let aired_on: String
    let released_on: String
}
