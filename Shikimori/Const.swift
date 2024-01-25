//
//  Const.swift
//  Shikimori
//
//  Created by vlapsk1y on 01.12.2023.
//

let DOMAIN_API: String = "shikimori.one"
let REDIRECT_URI: String = "shikimoriswift://auth"
let grants: String = "user_rates+comments+topics"
let AUTH_URL: String = "https://shikimori.one/oauth/authorize?client_id=\(CLIENT_ID)&redirect_uri=\(REDIRECT_URI.utf8)&response_type=code&scope=\(grants)"

let DEAFULTS_ACCESS_TOKEN: String = "access_token"
let DEFAULTS_REFRESH_TOKEN: String = "refresh_token"
let DEFAULTS_ISLOGGED: String = "is_logged"
let DEFAULTS_TIMESTAMP: String = "last_login"
