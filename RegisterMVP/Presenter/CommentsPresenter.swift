//
//  CommentsPresenter.swift
//  RegisterMVP
//
//  Created by Nicolas on 2/5/19.
//  Copyright © 2019 Nicolas. All rights reserved.
//

import Foundation

protocol CommentsDelegate {
    func commentsSuccess(comments: [String])
    func commentsFail(message: String)
}

class CommentsPresenter {
    var commentsDelegate: CommentsDelegate
    
    init(commentsDelegate: CommentsDelegate) {
        self.commentsDelegate = commentsDelegate
    }
    
    func gettingComments() {
        RegisterMVPEndPoint.getComments { (error, comments) in
            if let error = error {
                self.commentsDelegate.commentsFail(message: error)
                return
            }
            
            if let comments = comments {
                self.commentsDelegate.commentsSuccess(comments: comments)
            }
        }
    }
}
