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
                try await UserClient().getAnimeRates(idUser: AuthManager.shared.ownId, page: nil, limit: nil, status: nil, censored: nil) {
                    (result: Result<[UsersRate], APIRequestError>) in
                    switch result {
                    case .success(let x):
                        print(x)
                        self.rates = x
                    case .failure(let x):
                        break
                    }
                }
            }
        }
   }
}
