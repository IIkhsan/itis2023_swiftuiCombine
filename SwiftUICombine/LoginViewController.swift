//
//  LoginViewController.swift
//  SwiftUICombine
//
//  Created by ilyas.ikhsanov on 07.10.2023.
//

import UIKit
import Combine

class LoginViewController: UIViewController {
    
    let viewModel: ContentViewModel = .init()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        return tf
    }()

    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(continueButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    var cancellable: Set<AnyCancellable> = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.$isContinueButtonAvailable
            .sink { value in
                self.continueButton.isEnabled = value
            }
            .store(in: &cancellable)
    }
    
    @objc
    func continueButtonDidTap() {
        
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        viewModel.email = textField.text!
        return true
    }
}
