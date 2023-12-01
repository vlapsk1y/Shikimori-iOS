//
//  APIRequestDispatcher.swift
//  Shikimori
//
//  Created by vlapsk1y on 01.12.2023.
//

import Foundation

class APIRequestDispatcher {
    
    class func request<T: Codable>(apiRouter: APIRouter) async throws -> T {
        var components = URLComponents()
        components.host = domainAPI
        components.scheme = "https"
        components.path = apiRouter.path
        
        let url = components.url
        
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = apiRouter.method
        urlRequest.addValue(userAgent, forHTTPHeaderField: "User-Agent")
        
        let session = URLSession(configuration: .default)
                return try await withCheckedThrowingContinuation { continuation in
                    let dataTask = session.dataTask(with: urlRequest) { data, response, error in
                        if let error = error {
                            return continuation.resume(with: .failure(error))
                        }

                        guard let data = data else {
                            return continuation.resume(with: .failure(APIRequestError.noData))
                        }

                        do {
                            let responseObject = try JSONDecoder().decode(T.self, from: data)
                            DispatchQueue.main.async { // 6
                                return continuation.resume(with: .success(responseObject))
                            }
                        } catch {
                            return continuation.resume(with: .failure(error))
                        }
                    }
                    dataTask.resume()
                }
    }
}
