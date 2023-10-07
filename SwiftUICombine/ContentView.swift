//
//  ContentView.swift
//  SwiftUICombine
//
//  Created by ilyas.ikhsanov on 07.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack {
            TextField(text: $viewModel.email, prompt: Text("Введите email")) {
                
            }
            TextField(text: $viewModel.password, prompt: Text("Введите пароль")) {
                
            }
            Button(action: {}, label: {
                Text("Продолжить")
                    .foregroundColor(viewModel.isContinueButtonAvailable ? .green : .red)
            })
            .disabled(!viewModel.isContinueButtonAvailable)
        }
        .padding()
    }
}

#Preview {
    ContentView(viewModel: .init())
}
