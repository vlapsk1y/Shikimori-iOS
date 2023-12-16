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
    
    // Part of Auth (first part is authorization though Safari (ASWebAuthentication), because it's OAuth)
    
    case token(code: String?, grandType: String, refreshToken: String?)
    
    // important things
    
    var parameters: FormData? {
        switch self {
        case .token(let code, let grandType, let refreshToken):
            // мега костыль, который должен работать но нефига.
            var a = FormData(boundary: UUID().uuidString)
            a.addField(name: "client_id", value: CLIENT_ID)
            a.addField(name: "client_secret", value: CLIENT_SECRET)
            a.addField(name: "grand_type", value: grandType)
            
            //var p = [MultipartForm.Part(name: "client_id", value: CLIENT_ID),
            //             MultipartForm.Part(name: "client_secret", value: CLIENT_SECRET),
            //             MultipartForm.Part(name: "grand_type", value: grandType)]
            
            if code != nil {
                //p.append(MultipartForm.Part(name: "code", value: code!))
                //p.append(MultipartForm.Part(name: "redirect_uri", value: REDIRECT_URI))
                a.addField(name: "code", value: code!)
                a.addField(name: "redirect_uri", value: REDIRECT_URI)
            }
            else if refreshToken != nil {
                //p.append(MultipartForm.Part(name: "refresh_token", value: refreshToken!))
                a.addField(name: "refresh_token", value: refreshToken!)
            }
            
            //return MultipartForm(parts: p)
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
