//
//  SettingsView.swift
//  Shikimori
//
//  Created by vlapsk1y on 25.01.2024.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isLogged: Bool
    
    var body: some View {
        NavigationView {
            List {
                Button() {
                    AuthManager().deauth()
                    self.isLogged = false
                } label: {
                    Text("Выйти из аккаунта")
                        .foregroundStyle(.red)
                }
            }
            .navigationTitle("Настройки")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    SettingsView(isLogged: .constant(true))
}
