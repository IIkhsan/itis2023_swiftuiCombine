//
//  ContentViewModel.swift
//  SwiftUICombine
//
//  Created by ilyas.ikhsanov on 07.10.2023.
//

import Combine

final class ContentViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published private var isEmailValid: Bool = false
    @Published private var isPasswordValid: Bool = false
    
    @Published var isContinueButtonAvailable: Bool = false
    
    init() {
        $email
            .map { email in
                return email.count > 8
            }
            .assign(to: &$isEmailValid)
        
        $password
            .map { password in
                return password.count > 8
            }
            .assign(to: &$isPasswordValid)
        
        $isEmailValid.combineLatest($isPasswordValid)
            .map { $0 && $1 }
            .assign(to: &$isContinueButtonAvailable)
    }
}
