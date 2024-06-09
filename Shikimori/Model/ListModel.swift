//
//  ListModel.swift
//  Shikimori
//
//  Created by vlapsk1y on 25.01.2024.
//

import Foundation

class ListModel: ObservableObject {
    var rates: [UsersRate] = []
    @Published var isLoading: Bool = true

    func getRates() {
        Task {
            do {
                try await UserClient().getAnimeRates(idUser: AuthManager.shared.ownId,
                                                     page: nil,
                                                     limit: 300,
                                                     status: nil,
                                                     censored: nil) { (result: Result<[UsersRate], APIRequestError>) in
                    switch result {
                    case .success(let x):
                        Task { do { await self.loadRates(i: x) } }
                    case .failure:
                        break
                    }
                }
            }
        }
   }

    @MainActor private func loadRates(i: [UsersRate]) {
        self.rates = i
        self.isLoading = false
    }
}
