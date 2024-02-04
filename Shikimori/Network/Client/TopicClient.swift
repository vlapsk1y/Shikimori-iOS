//
//  TopicClient.swift
//  Shikimori
//
//  Created by vlapsk1y on 04.02.2024.
//

import Foundation

class TopicClient: TopicProtocol {
    func topics(page: Int?, limit: Int?, forum: String?, linked_id: Int?, linked_type: String?, type: String?, completion: @escaping (Result<[Topic], APIRequestError>) -> Void) async throws {
        try await APIRequestDispatcher.request(apiRouter: .topics(page: page, limit: limit, forum: forum, linked_id: linked_id, linked_type: linked_type, type: type)) { (result: Result<[Topic], APIRequestError>) in
            switch result {
            case .success(let x):
                completion(.success(x))
            case .failure(let x):
                completion(.failure(x))
            }
        }
    }
    
    func hot(limit: Int?, completion: @escaping (Result<[Topic], APIRequestError>) -> Void) async throws {
        try await APIRequestDispatcher.request(apiRouter: .topicsHot(limit: limit)) { (result: Result<[Topic], APIRequestError>) in
            switch result {
            case .success(let x):
                completion(.success(x))
            case .failure(let x):
                completion(.failure(x))
            }
        }
    }
}
