//
//  UsersProtocol.swift
//  Shikimori
//
//  Created by vlapsk1y on 02.12.2023.
//

import Foundation

protocol UsersProtocol {
    func getUser(id: Int) async throws -> User
    func whoami() async throws -> User
    func getAnimeRates() async throws -> UsersRate
}
