//
//  User.swift
//  RegisterMVP
//
//  Created by Nicolas on 2/4/19.
//  Copyright © 2019 Nicolas. All rights reserved.
//

import Foundation
import FirebaseFirestore

class User {
    var name: String
    var password: String
    
    init(name: String, password: String) {
        self.name = name
        self.password = password
    }
    
    static func from(document: QueryDocumentSnapshot) -> User {
        return User.init(name: document.data()["username"] as! String, password: document.data()["password"] as! String)
    }
}
