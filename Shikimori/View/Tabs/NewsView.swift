//
//  NewsView.swift
//  Shikimori
//
//  Created by vlapsk1y on 25.01.2024.
//

import SwiftUI

struct NewsView: View {
    @StateObject private var model = NewsModel()
    @Binding var isLogged: Bool
    
    var body: some View {
        NavigationView {
            if model.isLoading {
                ProgressView("Плиз вейт лоудинг")
                    .navigationTitle("Новости")
                    .navigationBarTitleDisplayMode(.large)
            } else {
                List {
                    ForEach(model.topics) { topic in
                        TopicRow(topic: topic)
                    }
                }
                .listStyle(.grouped)
                .navigationTitle("Новости")
                .navigationBarTitleDisplayMode(.large)
            }
        }.onAppear {
            if model.topics.isEmpty {
                model.getNews()
            }
            isLogged = model.isLogged
        }
    }
}

#Preview {
    NewsView(isLogged: .constant(true))
}
