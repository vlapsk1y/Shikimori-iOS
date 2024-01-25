//
//  ContentView.swift
//  Shikimori
//
//  Created by vlapsk1y on 30.11.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NewsView()
                .tabItem {
                    Label("Новости", systemImage: "newspaper")
                }
            ListView()
                .tabItem {
                    Label("Списки", systemImage: "list.bullet.rectangle.portrait")
                }
            SettingsView()
                .tabItem {
                    Label("Настройки", systemImage: "gear")
                }
        }
    }
}

#Preview {
    ContentView()
}
