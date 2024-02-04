//
//  TopicClient.swift
//  Shikimori
//
//  Created by vlapsk1y on 04.02.2024.
//

import Foundation

class TopicClient: TopicProtocol {
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
