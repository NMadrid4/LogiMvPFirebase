//
//  UserPresenter.swift
//  RegisterMVP
//
//  Created by Nicolas on 2/4/19.
//  Copyright © 2019 Nicolas. All rights reserved.
//

import Foundation

protocol LoginDelegate {
    func loginDidFail(message: String)
    func loginSuccess(user: User)
}

class LoginPresenter {
    var loginDelegate: LoginDelegate
    
    init(loginDelegate: LoginDelegate) {
        self.loginDelegate = loginDelegate
    }
    
    func logUser(withName name: String, password: String) {
        if name.isEmpty || password.isEmpty {
            loginDelegate.loginDidFail(message: "Complete los campos")
        }else {
            RegisterMVPEndPoint.loginUser(withUsername: name, password: password) { (error, user) in
                if let error = error {
                    print(error)
                    self.loginDelegate.loginDidFail(message: "Usuario/Contraseña incorrectos")
                    return
                }
                
                if let user = user {
                    self.loginDelegate.loginSuccess(user: user)
                }
            }            
        }
    }
    
}
