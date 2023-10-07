//
//  SwiftUICombineApp.swift
//  SwiftUICombine
//
//  Created by ilyas.ikhsanov on 07.10.2023.
//

import SwiftUI

@main
struct SwiftUICombineApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init())
        }
    }
}
