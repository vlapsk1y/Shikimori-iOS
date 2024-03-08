//
//  ListRow.swift
//  Shikimori
//
//  Created by vlapsk1y on 08.03.2024.
//

import SwiftUI

struct ListRow: View {
    var item: UsersRate
    
    var body: some View {
        HStack {
            Text(item.anime?.name ?? "")
        }
    }
}
