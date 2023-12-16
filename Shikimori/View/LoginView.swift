//
//  LoginView.swift
//  Shikimori
//
//  Created by vlapsk1y on 08.12.2023.
//

import SwiftUI

struct LoginView: View {
    
    
    var body: some View {
        VStack {
            Button(action: {
                AuthorizationModel().authInShikimori()
            }, label: {
                Text("Войти")
            })
        }
    }
}

#Preview {
    LoginView()
}
