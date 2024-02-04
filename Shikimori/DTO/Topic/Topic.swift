//
//  Topic.swift
//  Shikimori
//
//  Created by vlapsk1y on 03.02.2024.
//

import Foundation

struct Topic: Decodable, Identifiable {
    let id: Int
    let topicTitle, body, htmlBody, htmlFooter: String
    let createdAt: String
    let commentsCount: Int
    let forum: Forum
    let user: User
    let type: String
    let linkedID: Int?
    let linkedType: String?
    let linked: Linked?
    let viewed: Bool
    let event: String?
    let episode: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case topicTitle = "topic_title"
        case body
        case htmlBody = "html_body"
        case htmlFooter = "html_footer"
        case createdAt = "created_at"
        case commentsCount = "comments_count"
        case forum, user, type
        case linkedID = "linked_id"
        case linkedType = "linked_type"
        case linked, viewed
        case event, episode
    }
}
