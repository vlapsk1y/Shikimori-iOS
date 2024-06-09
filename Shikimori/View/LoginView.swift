//
//  LoginView.swift
//  Shikimori
//
//  Created by vlapsk1y on 08.12.2023.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLogged: Bool
    @ObservedObject private var auth = AuthorizationModel()
    var body: some View {
        VStack {
            Spacer()
            Image(uiImage: UIImage(named: "AppIcon")!)
                .resizable()
                .frame(width: 240, height: 240)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .padding()
            Text("Добро пожаловать в Шикимори!")
                .font(.title3)
                .bold()
                .lineLimit(1)
                .padding()
            Spacer()
            Text("не является официальным приложением")
                .font(.caption)
                .foregroundStyle(.gray)
            Button(action: {
                auth.authInShikimori { x in
                    isLogged = x
                }
            }, label: {
                Text("Войти")
                    .frame(width: 300, height: 30)
            }).buttonStyle(.borderedProminent)
                .controlSize(.large)
                .padding()
        }.alert("Что-то пошло не так..", isPresented: $auth.hasError) {
            Button("OK", role: .cancel, action: {})
        } message: {
            Text(auth.message)
        }
    }
}

#Preview {
    LoginView(isLogged: .constant(false))
}
