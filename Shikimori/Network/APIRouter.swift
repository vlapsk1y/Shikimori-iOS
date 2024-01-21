//
//  APIRouter.swift
//  Shikimori
//
//  Created by vlapsk1y on 30.11.2023.
//

enum APIRouter {
    
    // User methods
    
    // doc: https://shikimori.one/api/doc/1.0/users/show
    case getUser(id: Int)
    case whoami
    
    // Animes methods
    
    // doc: https://shikimori.one/api/doc/1.0/animes/show
    case getAnime(id: Int)
    
    // Part of Auth (first part is authorization though Safari (ASWebAuthentication), because it's OAuth)
    
    case token(code: String?, grandType: String, refreshToken: String?)
    
    // important things
    
    var parameters: FormData? {
        switch self {
        case .token(let code, let grandType, let refreshToken):
            var a = FormData()
            a.addField(name: "client_id", value: CLIENT_ID)
            a.addField(name: "client_secret", value: CLIENT_SECRET)
            a.addField(name: "grant_type", value: grandType)
            
            
            if code != nil {
                a.addField(name: "code", value: code!)
                a.addField(name: "redirect_uri", value: REDIRECT_URI)
            }
            else if refreshToken != nil {
                a.addField(name: "refresh_token", value: refreshToken!)
            }
            a.complete()
            return a
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
