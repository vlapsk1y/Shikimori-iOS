//
//  ListView.swift
//  Shikimori
//
//  Created by vlapsk1y on 25.01.2024.
//

import SwiftUI

struct ListView: View {
    @Binding var isLogged: Bool
    
    var body: some View {
        NavigationView {
            List {
                
            }
            .navigationTitle("Список")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ListView(isLogged: .constant(true))
}
