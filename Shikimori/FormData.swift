//
//  FormData.swift
//  Shikimori
//
//  Created by vlapsk1y on 17.12.2023.
//

import Foundation

struct FormData {
    let boundary: String
    let contentType: String
    var data: Data
    
    mutating func addField(name: String, value: String) -> Self {
        let str = "\nContent-Disposition: form-data; name=\"\(name)\"\n\n\(value)\n--"+boundary
        data.append(str.data(using: .utf8)!)
        
        return self 
    }
    
    
    init(boundary: String) {
        self.boundary = boundary
        self.contentType = "multipart/form-data; boundary=--" + self.boundary
        self.data = Data("--\(self.boundary)".data(using: .utf8)!)
    }
}
