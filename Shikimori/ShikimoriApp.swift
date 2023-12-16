//
//  ShikimoriApp.swift
//  Shikimori
//
//  Created by vlapsk1y on 30.11.2023.
//

import SwiftUI

@main
struct ShikimoriApp: App {
    @ObservedObject var auth = AuthorizationModel()
    
    var body: some Scene {
        WindowGroup {
            if auth.isLogged() {
                ContentView()
            } else {
                LoginView()
            }
        }
    }
    
    
}
