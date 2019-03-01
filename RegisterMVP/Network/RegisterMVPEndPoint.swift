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
        Util.dbFirestoreConfig().collection(FIREBASE_USERS).whereField(FIELD_USERNAME, isEqualTo: username)
            .whereField(FIELD_PWD, isEqualTo: password).getDocuments { (result, error) in
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
    
    static func registerNewUser(username: String , password: String, completionHandler: @escaping(_ error: String?, _ userId: String?)->Void) {
        var ref: DocumentReference? = nil
         ref = Util.dbFirestoreConfig().collection(FIREBASE_USERS).addDocument(data:
            [FIELD_USERNAME: username,
             FIELD_PWD: password]){error in
                if let error = error {
                    completionHandler(error.localizedDescription,nil)
                }else {
                    completionHandler(nil,ref!.documentID)
                }
        }
    }
    
    static func getComments(completionHandler: @escaping(_ error: String?, _ comments: [String]?)->Void) {
        Util.dbFirestoreConfig().collection(FIREBASE_COMMENTS).getDocuments { (result, error) in
            guard error == nil, let documents = result?.documents else {
                completionHandler(error?.localizedDescription, nil)
                return
            }
            completionHandler(nil,documents.compactMap({$0.data()["comentario"] as? String}))
        }
    }
    
}
