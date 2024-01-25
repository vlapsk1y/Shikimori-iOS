//
//  ShikimoriApp.swift
//  Shikimori
//
//  Created by vlapsk1y on 30.11.2023.
//

import SwiftUI

@main
struct ShikimoriApp: App {
    var body: some Scene {
        WindowGroup {
            if AuthManager.shared.isLogged {
                ContentView()
            } else {
                LoginView()
            }
        }
    }
    
    
}
