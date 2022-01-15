//
//  ViewController.swift
//  SB_2_3
//
//  Created by Артем ШАЛИН on 13.01.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var userPasswordTF: UITextField!
    
    private let userName = "mimi";
    private let password = "mumu";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.layer.cornerRadius = 15;
        userPasswordTF.layer.cornerRadius = 15;
    
    }

    @IBAction func loginButtonTapped() {
        if userNameTF.text != userName || userPasswordTF.text != password {
                        
            presentAlert(title: "Log In is failed",
                         message: "Wrong username or password",
                         alertaction: UIAlertAction(title: "Ok", style: .default))
            
        }
    }
    
    @IBAction func forgotUserNameButton() {
        
        presentAlert(title: "Your user name is",
                     message: "'\(userName)'",
                     alertaction: UIAlertAction(title: "Ok", style: .default))
        
    }
    
    @IBAction func forgotPasswordButton() {
        
        let alertaction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.userPasswordTF.text = ""
        }
        
        presentAlert(title: "Your password is",
                     message: "'\(password)'",
                     alertaction: alertaction)
        
    }
    
}

// MARK: - Navigation
extension LoginViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeViewCtl = segue.destination as? WelcomeViewController else {return}
        guard let introductionUsername = userNameTF.text else { return }
        welcomeViewCtl.username = introductionUsername
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        userPasswordTF.text = ""
    }
}
    
// MARK: - Common func
extension LoginViewController {
    private func presentAlert(title: String, message: String, alertaction: UIAlertAction) {
        
        let alertCtl = UIAlertController(title: title,
                                         message: message,
                                         preferredStyle: .alert
        )
        
        alertCtl.addAction(alertaction)
        self.present(alertCtl, animated: true)
        
    }
}

// MARK: - Hide Keyboard
extension LoginViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    

    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            userPasswordTF.becomeFirstResponder()
        } else if textField == userPasswordTF {
            loginButtonTapped()
            performSegue(withIdentifier: "segueToWelcomeVC", sender: nil)
        }
        return true
    }
}