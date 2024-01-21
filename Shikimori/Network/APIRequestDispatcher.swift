//
//  APIRequestDispatcher.swift
//  Shikimori
//
//  Created by vlapsk1y on 01.12.2023.
//

import Foundation

class APIRequestDispatcher {
    
//    var components = URLComponents()
//    components.host = DOMAIN_API
//    components.scheme = "https"
//    components.path = apiRouter.path
//    
//    let url = components.url
//    
//    var urlRequest = URLRequest(url: url!)
//    urlRequest.httpMethod = apiRouter.method
//    urlRequest.addValue(USER_AGENT, forHTTPHeaderField: "User-Agent")
//    urlRequest.addValue(apiRouter.parameters!.contentType, forHTTPHeaderField: "Content-Type")
//    urlRequest.httpBody = apiRouter.parameters!.data
    
    class func request<T: Decodable>(apiRouter: APIRouter, completion: @escaping (Result<T, APIRequestError>) -> Void) async throws -> Void {
        var components = URLComponents()
        components.host = DOMAIN_API
        components.scheme = "https"
        components.path = apiRouter.path
        
        let url = components.url
        
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = apiRouter.method
        urlRequest.addValue(USER_AGENT, forHTTPHeaderField: "User-Agent")
        urlRequest.addValue(apiRouter.parameters!.contentType, forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = apiRouter.parameters!.data
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let resp = try JSONDecoder().decode(T.self, from: data)
                completion(.success(resp))
            } catch {
                let e = try! JSONDecoder().decode(ErrorAPI.self, from: data)
                completion(.failure(.message(e.description)))
            }
        }.resume()
    }
    
    
}
