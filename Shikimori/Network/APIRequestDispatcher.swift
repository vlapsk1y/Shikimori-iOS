//
//  APIRequestDispatcher.swift
//  Shikimori
//
//  Created by vlapsk1y on 01.12.2023.
//

import Foundation

class APIRequestDispatcher {
    class func request<T: Decodable>(apiRouter: APIRouter,
                                     completion: @escaping (Result<T, APIRequestError>) -> Void) async throws {
        var components = URLComponents()
        components.host = DOMAIN_API
        components.scheme = "https"
        components.path = apiRouter.path
        if !apiRouter.URLQueris!.isEmpty {
            components.queryItems = apiRouter.URLQueris
        }

        let url = components.url
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = apiRouter.method
        urlRequest.addValue(USER_AGENT, forHTTPHeaderField: "User-Agent")
        if AuthManager.shared.isLogged && apiRouter.path != "/oauth/token" {
            urlRequest.addValue("Bearer \(AuthManager.shared.accessToken!)", forHTTPHeaderField: "Authorization")
        }
        if apiRouter.method != "GET" {
            urlRequest.addValue(apiRouter.parameters!.contentType, forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = apiRouter.parameters!.data
        }

        URLSession.shared.dataTask(with: urlRequest) { (data, response, _) in
            guard let data else {
                completion(.failure(.invalidData))
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                if apiRouter.path == "/oauth/token" && httpResponse.statusCode == 401 {
                    AuthManager.shared.deauth()
                    completion(.failure(.deauth))
                }
            }

            do {
                let resp = try JSONDecoder().decode(T.self, from: data)
                completion(.success(resp))
            } catch(let err) {
                print(err)
                do {
                    let e = try JSONDecoder().decode(ErrorAPI.self, from: data)
                    completion(.failure(.message(e.description)))
                } catch {}
            }
        }.resume()
    }
}
