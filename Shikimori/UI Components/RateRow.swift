//
//  ListRow.swift
//  Shikimori
//
//  Created by vlapsk1y on 08.03.2024.
//

import SwiftUI

struct RateRow: View {
    var item: UsersRate

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(item.anime?.name ?? "")
                    .lineLimit(1)
            }
            Text("\(StatusAnimeList(fromRawValue: item.status).readable) | \(item.episodes)/\(item.anime!.episodes)")
                .foregroundStyle(.gray)
                .font(.caption)
        }
    }
}
