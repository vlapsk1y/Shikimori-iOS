//
//  NewsModel.swift
//  Shikimori
//
//  Created by vlapsk1y on 25.01.2024.
//

import Foundation

import Foundation

class NewsModel: ObservableObject {
    @Published var isLoading: Bool = true
    var topics: [Topic] = []
    @Published var isLogged: Bool = true
    
    func getNews() {
        Task {
            do {
                try await TopicClient().topics(page: nil, limit: 30, forum: "news", linked_id: nil, linked_type: nil, type: nil) {
                    (result: Result<[Topic], APIRequestError>) in
                    switch result {
                    case .success(let x):
                        Task {
                            do {
                                await self.updateTopics(x)
                            }
                        }
                    case .failure(let x):
                        if x == APIRequestError.deauth {
                            self.isLogged = false
                        }
                    }
                }
            } 
            catch { print(error) }
        }
    }
    
    @MainActor
    func updateTopics(_ newTopics: [Topic]) {
        self.topics = newTopics
        self.isLoading = false
    }
}
