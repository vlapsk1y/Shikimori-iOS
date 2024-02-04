//
//  NewsModel.swift
//  Shikimori
//
//  Created by vlapsk1y on 25.01.2024.
//

import Foundation

class NewsModel: ObservableObject {
    @Published var hasError: Bool = false
    var message: String = String()
    
    func getNews() {
        
    }
}
