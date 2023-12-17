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
        data.append("--".data(using: .utf8)!)
        
        return self
    }
    
    init() {
        self.boundary = "ShikimoriSwiftBoundary" // MARK: надо потом что-нибудь с этим сделать, по-идеи это значение должно быть рандомным, но из-за каких-то приколов свифта при передаче объекта какого-то черта здесь значение меняется и не совпадает с первоначальным при иницилизации в APIRouter, в итоге запрос становится инвалидным из-за несоответствия boundary в шапке и теле запроса.
        self.contentType = "multipart/form-data; boundary=" + boundary
        self.data = Data("--\(boundary)".data(using: .utf8)!)
    }
}
