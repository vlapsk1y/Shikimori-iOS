//
//  TopicRow.swift
//  Shikimori
//
//  Created by vlapsk1y on 04.02.2024.
//

import SwiftUI
import SwiftSoup

struct TopicRow: View {
    var topic: Topic
    
    @Environment(\.colorScheme) var color
    var body: some View {
        if extractFromFooterHTML(doc: topic.htmlFooter) != nil {
            VStack {
                AsyncImage(url: URL(string: extractFromFooterHTML(doc: topic.htmlFooter)!), content: {
                    image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width - 30, height: 250)
                        .clipped()
                }, placeholder: {
                    ZStack {
                        Rectangle()
                            .fill(.gray)
                            .opacity(0.4)
                        ProgressView()
                            .padding(.top)
                    }
                })
                .frame(width: UIScreen.main.bounds.width - 30, height: 250)
                Spacer(minLength: 0)
                HStack {
                    VStack(alignment: .leading) {
                        Text(topic.topicTitle)
                            .bold()
                            .lineLimit(1)
                        Text("Автор: " + topic.user.nickname)
                            .font(.footnote)
                            .foregroundStyle(.gray)
                        Text("Категория: " + topic.forum.name)
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                    .padding()
                    .frame(alignment: .leading)
                    Spacer()
                }
                .padding(.bottom)
            }
            .frame(width: UIScreen.main.bounds.width - 30, height: 320)
            .background(color == .dark ? Color.gray.opacity(0.2) : Color.white)
            .cornerRadius(20.0)
        } else {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(topic.topicTitle)
                            .bold()
                            .lineLimit(1)
                        Text("Автор: " + topic.user.nickname)
                            .font(.footnote)
                            .foregroundStyle(.gray)
                        Text("Категория: " + topic.forum.name)
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                    .padding()
                    .frame(alignment: .leading)
                    Spacer()
                }
                .padding(.bottom)
                .padding(.top)
            }
            .frame(width: UIScreen.main.bounds.width - 30, height: 70)
            .background(color == .dark ? Color.gray.opacity(0.2) : Color.white)
            .cornerRadius(20.0)
        }
    }
}
