//
//  APIRouter.swift
//  Shikimori
//
//  Created by vlapsk1y on 30.11.2023.
//

enum APIRouter {
    
    // Topic methods
    // doc: https://shikimori.one/api/doc/1.0/topics
    case topicsHot(limit: Int?)
    case topics(page: Int?, limit: Int?, forum: String?, linked_id: Int?, linked_type: String?, type: String?)
    
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
            var form = FormData()
            form.addField(name: "client_id", value: CLIENT_ID)
            form.addField(name: "client_secret", value: CLIENT_SECRET)
            form.addField(name: "grant_type", value: grandType)
            
            
            if code != nil {
                form.addField(name: "code", value: code!)
                form.addField(name: "redirect_uri", value: REDIRECT_URI)
            }
            else if refreshToken != nil {
                form.addField(name: "refresh_token", value: refreshToken!)
            }
            form.complete()
            return form
        case .getAnime, .getUser, .whoami:
            return nil
        case .topicsHot(let limit):
            var form = FormData()
            if limit != nil {
                form.addField(name: "limit", value: String(limit!))
            }
            form.complete()
            return form
        case .topics(let page, let limit, let forum, let linked_id, let linked_type, let type):
            var form = FormData()
            if let page = page {
                form.addField(name: "page", value: String(limit!))
            }
            if let limit = limit {
                form.addField(name: "limit", value: String(limit))
            }
            if let forum = forum {
                form.addField(name: "forum", value: forum)
            }
            if let linked_id = linked_id {
                form.addField(name: "linked_id", value: String(linked_id))
            }
            if let linked_type = linked_type {
                form.addField(name: "linked_type", value: linked_type)
            }
            if let type = type {
                form.addField(name: "type", value: type)
            }
            form.complete()
            
            return form
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
        case .topicsHot:
            return "/api/topics/hot"
        case .topics:
            return "/api/topics"
        }
    }
    
    var method: String {
        switch self {
        case .getAnime, .getUser, .whoami, .topicsHot, .topics:
            return "GET"
        case .token:
            return "POST"
        }
    }
}
