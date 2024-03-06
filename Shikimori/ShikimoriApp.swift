//
//  ShikimoriApp.swift
//  Shikimori
//
//  Created by vlapsk1y on 30.11.2023.
//

import SwiftUI

@main
struct ShikimoriApp: App {
    @State var islogged: Bool = AuthManager.shared.isLogged
    
    var body: some Scene {
        WindowGroup {
            if islogged {
                ContentView(isLogged: $islogged)
                    .transition(.slide)
                    .onAppear {
                        if Int(NSDate().timeIntervalSince1970) - UserDefaults.standard.integer(forKey: DEFAULTS_TIMESTAMP) > 86400 {
                            AuthManager.shared.updateToken()
                        }
                    }
            } else {
                LoginView(isLogged: $islogged)
                    .transition(.slide)
            }
        }
    }
    
    
}
