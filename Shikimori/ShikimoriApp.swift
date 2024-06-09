//
//  ShikimoriApp.swift
//  Shikimori
//
//  Created by vlapsk1y on 30.11.2023.
//

import SwiftUI

@main
struct ShikimoriApp: App {
    @State var islogged: Bool

    init() {
        let timestamp = UserDefaults.standard.integer(forKey: DEFAULTS_TIMESTAMP)
        let now = Int(NSDate().timeIntervalSince1970)
        if UserDefaults.standard.bool(forKey: DEFAULTS_ISLOGGED) && now - timestamp > 86400 {
            AuthManager.shared.updateToken()
        }

        sleep(1)

        self.islogged = AuthManager.shared.isLogged
    }

    var body: some Scene {
        WindowGroup {
            if islogged {
                ContentView(isLogged: $islogged)
                    .transition(.slide)
            } else {
                LoginView(isLogged: $islogged)
                    .transition(.slide)
            }
        }
    }

}
