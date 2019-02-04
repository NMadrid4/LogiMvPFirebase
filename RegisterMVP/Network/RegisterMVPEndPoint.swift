//
//  RegisterMVPEndPoint.swift
//  RegisterMVP
//
//  Created by Nicolas on 2/4/19.
//  Copyright © 2019 Nicolas. All rights reserved.
//

import Foundation
import FirebaseFirestore

class RegisterMVPEndPoint {
    
    static func loginUser(withUsername username: String, password: String, completionHandler: @escaping(_ error: String?, _ user: User?)->Void){
        Util.dbFirestoreConfig().collection("Usuarios").whereField("username", isEqualTo: username)
            .whereField("password", isEqualTo: password).getDocuments { (result, error) in
                if let error = error {
                    completionHandler(error.localizedDescription, nil)
                }
                
                if let documents = result?.documents {
                    if documents.count > 0 {
                        let document = documents.first
                        completionHandler(nil, User.from(document: document!))
                    }else {
                        completionHandler("Usuario no existe", nil)
                    }
                }
                
        }
    }
    
}
