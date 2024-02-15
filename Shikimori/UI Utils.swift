//
//  UI Utils.swift
//  Shikimori
//
//  Created by vlapsk1y on 15.02.2024.
//

import Foundation
import SwiftSoup

func extractFromFooterHTML(doc: String) -> String? {
    do {
       let doc: Document = try SwiftSoup.parse(doc)
        var url = try doc.select("img").last()!.attr("src")
        if (url.hasPrefix("/")) {
            url = "https:" + url
        }
        return url
    } catch Exception.Error(let type, let message) {
        print(message)
    } catch {
        return nil
    }
    return nil
}
