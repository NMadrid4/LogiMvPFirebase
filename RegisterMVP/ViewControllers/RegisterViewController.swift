//
//  RegisterViewController.swift
//  RegisterMVP
//
//  Created by Nicolas on 2/4/19.
//  Copyright © 2019 Nicolas. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var presenter: RegisterPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = RegisterPresenter(registerDelegate: self)
    }
    
    @IBAction func registerAction(_ sender: Any) {
        presenter?.registerNewUser(username: usernameTextField.text!, password: passwordTextField.text!)
    }
    
}

extension RegisterViewController: registerDelegate {
    func registerSuccess() {
        usernameTextField.text = ""
        passwordTextField.text = ""
        print("Usuario registrado")
    }
    
    func registerFailed(message: String) {
        print("Error al registrar \(message)")
    }
}
