//
//  Util.swift
//  RegisterMVP
//
//  Created by Nicolas on 2/4/19.
//  Copyright © 2019 Nicolas. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Reachability

class Util {
    
    static func dbFirestoreConfig() -> Firestore {
        let db = Firestore.firestore()
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
        return db
    }
    
    static func userHasConnection() -> Bool {
        let reach: Reachability! = Reachability()
        return reach.connection != .none
    }
    
    
}
