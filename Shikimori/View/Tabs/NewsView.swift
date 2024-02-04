//
//  NewsView.swift
//  Shikimori
//
//  Created by vlapsk1y on 25.01.2024.
//

import SwiftUI

struct NewsView: View {
    @ObservedObject private var model = NewsModel()
    
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
            model.getNews()
            print("access_token: \(AuthManager.shared.access_token)")
        }
    }
}

#Preview {
    NewsView()
}
