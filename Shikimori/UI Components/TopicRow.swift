//
//  TopicRow.swift
//  Shikimori
//
//  Created by vlapsk1y on 04.02.2024.
//

import SwiftUI

struct TopicRow: View {
    let topic: Topic
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(topic.topicTitle)
                .bold()
                .lineLimit(1)
            Text("Автор: " + (topic.user.name ?? topic.user.nickname))
                .font(.footnote)
                .foregroundStyle(.gray)
            Text("Категория: " + (topic.linkedType!))
                .font(.footnote)
                .foregroundStyle(.gray)
        }
    }
}


