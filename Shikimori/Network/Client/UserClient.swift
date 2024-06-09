//
//  UserClient.swift
//  Shikimori
//
//  Created by vlapsk1y on 03.03.2024.
//

import Foundation

class UserClient: UsersProtocol {
    func getAnimeRates(idUser: Int,
                       page: Int?,
                       limit: Int?,
                       status: String?,
                       censored: Bool?,
                       completion: @escaping (Result<[UsersRate], APIRequestError>) -> Void) async throws {
        try await APIRequestDispatcher
            .request(apiRouter: .animeRates(idUser: idUser,
                                            page: page,
                                            limit: limit,
                                            status: status,
                                            censored: censored)) { (result: Result<[UsersRate], APIRequestError>) in
            switch result {
            case .success(let x):
                completion(.success(x))
            case .failure(let x):
                completion(.failure(x))
            }
        }
    }

    func getUser(id: Int, completion: @escaping (Result<User, APIRequestError>) -> Void) async throws {
            try await APIRequestDispatcher
            .request(apiRouter: .getUser(id: id)) { (result: Result<User, APIRequestError>) in
                switch result {
                case .success(let x):
                    completion(.success(x))
                case .failure(let x):
                    completion(.failure(x))
                }
            }
    }

    func whoami(completion: @escaping (Result<User, APIRequestError>) -> Void) async throws {
        try await APIRequestDispatcher
            .request(apiRouter: .whoami) { (result: Result<User, APIRequestError>) in
            switch result {
            case .success(let x):
                completion(.success(x))
            case .failure(let x):
                completion(.failure(x))
            }
        }
    }
}
