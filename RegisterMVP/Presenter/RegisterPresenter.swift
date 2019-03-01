//
//  RegisterPresenter.swift
//  RegisterMVP
//
//  Created by Nicolas on 2/4/19.
//  Copyright © 2019 Nicolas. All rights reserved.
//

import Foundation

protocol registerDelegate {
    func registerSuccess()
    func registerFailed(message: String)
    func noConnection()
}

class RegisterPresenter {
    var registerDelegate: registerDelegate
    
    init(registerDelegate: registerDelegate) {
        self.registerDelegate = registerDelegate
    }
    
    func registerNewUser(username: String, password: String) {
        if username.isEmpty {
            registerDelegate.registerFailed(message: "email vacio")
        }else {
            if Util.userHasConnection() {
                RegisterMVPEndPoint.registerNewUser(username: username, password: password) { (error, newIDuser) in
                    if let error = error {
                        self.registerDelegate.registerFailed(message: error)
                        return
                    }
                    
                    if let _ = newIDuser {
                        self.registerDelegate.registerSuccess()
                    }
                }
            }else {
                self.registerDelegate.noConnection()
            }
        }
    }
}
