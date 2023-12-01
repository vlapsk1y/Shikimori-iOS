//
//  APIRouter.swift
//  Shikimori
//
//  Created by vlapsk1y on 30.11.2023.
//

import MultipartForm

enum APIRouter {
    
    // User methods
    
    // doc: https://shikimori.one/api/doc/1.0/users/show
    case getUser(id: Int)
    case whoami
    
    // Animes methods
    
    // doc: https://shikimori.one/api/doc/1.0/animes/show
    case getAnime(id: Int)
    
    // Part of Auth (first part is authorization via Safari, because it's OAuth)
    
    case token(code: String?, id: String, secret: String, redirect: String?, grandType: String, refreshToken: String?)
    
    // important things
    
    var parameters: MultipartForm? {
        switch self {
        case .token(let code, let id, let secret, let redirect, let grandType, let refreshToken):
            var p = [MultipartForm.Part(name: "client_id", value: id),
                         MultipartForm.Part(name: "client_secret", value: secret),
                         MultipartForm.Part(name: "grand_type", value: grandType)]
            
            if code != nil {
                p.append(MultipartForm.Part(name: "code", value: code!))
            }
            else if redirect != nil {
                p.append(MultipartForm.Part(name: "redirect_uri", value: redirect!))
            }
            else if refreshToken != nil {
                p.append(MultipartForm.Part(name: "refresh_token", value: refreshToken!))
            }
            
            return MultipartForm(parts: p)
        case .getAnime, .getUser, .whoami:
            return nil
        }
    }
    
    var path: String {
        switch self {
        case .getUser(let id):
            return "/api/users/\(id)"
        case .whoami:
            return "/api/users/whoami"
        case .getAnime(let id):
            return "/api/animes/\(id)"
        case .token:
            return "/oauth/token"
        }
    }
    
    var method: String {
        switch self {
        case .getAnime, .getUser, .whoami:
            return "GET"
        case .token:
            return "POST"
        }
    }
}
