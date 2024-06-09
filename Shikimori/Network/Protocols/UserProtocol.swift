//
//  UsersProtocol.swift
//  Shikimori
//
//  Created by vlapsk1y on 02.12.2023.
//

import Foundation

protocol UsersProtocol {
    func getUser(id: Int, completion: @escaping (Result<User, APIRequestError>) -> Void) async throws
    func whoami(completion: @escaping (Result<User, APIRequestError>) -> Void) async throws
    func getAnimeRates(idUser: Int,
                       page: Int?,
                       limit: Int?,
                       status: String?,
                       censored: Bool?,
                       completion: @escaping (Result<[UsersRate], APIRequestError>) -> Void) async throws
}
