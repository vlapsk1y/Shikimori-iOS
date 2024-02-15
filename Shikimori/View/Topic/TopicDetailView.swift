//
//  TopicDetailView.swift
//  Shikimori
//
//  Created by vlapsk1y on 13.02.2024.
//

import SwiftUI

struct TopicDetailView: View {
    let topic: Topic
    
    var body: some View {
        List {
            Text(topic.body)
        }.navigationTitle(topic.topicTitle)
    }
}
