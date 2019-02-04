//
//  ViewController.swift
//  RegisterMVP
//
//  Created by Nicolas on 2/4/19.
//  Copyright © 2019 Nicolas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var presenter: LoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(loginDelegate: self)
    }

    @IBAction func loginAction(_ sender: Any) {
        self.presenter?.logUser(withName: userTextField.text!, password: passwordTextField.text!)
    }
    
    private func showAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let done = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alert.addAction(done)
        return alert
    }
}

extension ViewController: LoginDelegate {
    func loginSuccess(user: User) {
        performSegue(withIdentifier: "showSecondVC", sender: user)
    }
    
    func loginDidFail(message: String) {
        self.present(showAlert(title: "Error", message: message), animated: true)
    }
}

//Segues
extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecondVC" {
            let secondVC = segue.destination as! WelcomeViewController
            secondVC.user = sender as? User
        }
    }
}

