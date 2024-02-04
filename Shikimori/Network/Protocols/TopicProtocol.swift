//
//  TopicProtocol.swift
//  Shikimori
//
//  Created by vlapsk1y on 04.02.2024.
//

import Foundation

protocol TopicProtocol {
    func hot(limit: Int?, completion: @escaping (Result<[Topic], APIRequestError>) -> Void) async throws -> Void
    func topics(page: Int?, limit: Int?, forum: String?, linked_id: Int?, linked_type: String?, type: String?) async throws -> Void
}
