//
//  ContentView.swift
//  Shikimori
//
//  Created by vlapsk1y on 30.11.2023.
//

import SwiftUI

struct ContentView: View {
    @Binding var isLogged: Bool
    
    var body: some View {
        TabView {
            NewsView(isLogged: $isLogged)
                .tabItem {
                    Label("Новости", systemImage: "newspaper")
                }
            ListView(isLogged: $isLogged)
                .tabItem {
                    Label("Список", systemImage: "list.bullet.rectangle.portrait")
                }
            SettingsView(isLogged: $isLogged)
                .tabItem {
                    Label("Настройки", systemImage: "gear")
                }
        }
    }
}
