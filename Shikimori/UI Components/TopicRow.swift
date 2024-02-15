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
        VStack {
            AsyncImage(url: URL(string: extractFromFooterHTML(doc: topic.htmlFooter) ?? ""), content: {
                image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 30, height: 250)
            }, placeholder: {
                ProgressView()
                    .padding(.top)
            })
            .frame(width: UIScreen.main.bounds.width - 30, height: 250)
            Spacer(minLength: 0)
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
            .frame(width: UIScreen.main.bounds.width - 60)
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width - 30, height: 320)
        .background(color == .dark ? Color.black : Color.white)
        .cornerRadius(20.0)
    }
}
