//
//  FormData.swift
//  Shikimori
//
//  Created by vlapsk1y on 17.12.2023.
//

import Foundation

struct FormData {
    var boundary: String
    var contentType: String
    var data: Data

    @discardableResult mutating func addField(name: String, value: String) -> Self {
        let str = "\r\nContent-Disposition: form-data; name=\"\(name)\"\r\n\r\n\(value)\r\n--\(boundary)"
        data.append(str.data(using: .utf8)!)
        return self
    }
    @discardableResult mutating func complete() -> Self {
        data.append(Data("--".utf8))
        return self
    }

    init() {
        self.boundary = "ShikimoriSwiftBoundary"
        self.contentType = "multipart/form-data; boundary=" + boundary
        self.data = Data("--\(boundary)".utf8)
    }
}
