//
//  ListView.swift
//  Shikimori
//
//  Created by vlapsk1y on 25.01.2024.
//

import SwiftUI

struct ListView: View {
    @Binding var isLogged: Bool
    @StateObject private var model = ListModel()
    
    var body: some View {
        NavigationView {
            if model.isLoading {
                ProgressView()
            } else {
                List {
                    ForEach(model.rates) { rate in
                        RateRow(item: rate)
                    }
                }.navigationTitle("Список")
                    .navigationBarTitleDisplayMode(.large)
            }
        }
        .onAppear {
            model.getRates()
        }
    }
}

#Preview {
    ListView(isLogged: .constant(true))
}
