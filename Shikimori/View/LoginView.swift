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
            Image(uiImage: UIImage(named: "AppIcon")!)
                .resizable()
                .frame(width: 240, height: 240)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .padding()
            Button(action: {
                AuthorizationModel().authInShikimori()
            }, label: {
                Text("Войти")
                    .frame(width: 300)
            }).buttonStyle(.borderedProminent)
                .controlSize(.large)
        }
    }
}

#Preview {
    LoginView()
}
