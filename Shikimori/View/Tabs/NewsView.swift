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
    @State private var isPresenting = false
    
    var body: some View {
        NavigationView {
            if model.isLoading {
                ProgressView("Плиз вейт лоудинг")
                    .navigationTitle("Новости")
                    .navigationBarTitleDisplayMode(.large)
            } else {
                ScrollView {
                    VStack {
                        ForEach(model.topics) { topic in
                            TopicRow(topic: topic)
                                .padding()
                                .shadow(radius: 15)
                        }
                    }
                    .padding(.bottom)
                }
                .background(Color.primary.opacity(0.06).ignoresSafeArea())
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
