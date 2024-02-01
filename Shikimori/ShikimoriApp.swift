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
                ContentView()
                    .transition(.slide)
            } else {
                LoginView(isLogged: $islogged)
                    .transition(.slide)
            }
        }
    }
    
    
}
