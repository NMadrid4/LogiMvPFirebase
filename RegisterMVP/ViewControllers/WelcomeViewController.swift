//
//  WelcomeViewController.swift
//  RegisterMVP
//
//  Created by Nicolas on 2/4/19.
//  Copyright © 2019 Nicolas. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var commentsTableView: UITableView!
    
    let commentCellIdentifier = "cell"
    var comments: [String]?
    var presenter: CommentsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CommentsPresenter(commentsDelegate: self)
        presenter?.gettingComments()
    }
    
}

//MARK: TableViewDataSource
extension WelcomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: commentCellIdentifier, for: indexPath)
        cell.textLabel!.text = comments?[indexPath.row] ?? ""
        return cell
    }
}

//Presenter data
extension WelcomeViewController: CommentsDelegate {
    func commentsSuccess(comments: [String]) {
        self.comments = comments
        commentsTableView.reloadData()
    }
    
    func commentsFail(message: String) {
        print(message)
    }    
}
