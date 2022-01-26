//
//  ViewController.swift
//  SB_2_3
//
//  Created by Артем ШАЛИН on 13.01.2022.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var userPasswordTF: UITextField!
    
    // MARK: - Override Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let welcomeViewCtl = segue.destination as? WelcomeViewController else {return}
//        guard let introductionUsername = userNameTF.text else { return }
//        welcomeViewCtl.username = introductionUsername
        
        let person = getPersonData()
        
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeViewCtl = viewController as? WelcomeViewController {
                welcomeViewCtl.username = "\(person.firstname) \(person.lastname)"
            } else if let resumeViewCtl = viewController as? ResumeViewController {
                resumeViewCtl.profession = person.resume.currentProfession
                resumeViewCtl.workExpirience = person.resume.workExpirience
                resumeViewCtl.acivity = person.resume.activity
            } else if let aboutMeViewCtl = viewController as? AboutMeViewController {
                aboutMeViewCtl.aboutMe = person.moreAboutPerson
            } else if let hobbyViewCtl = viewController as? HobbyViewController {
                hobbyViewCtl.hobbyOneTitle = person.hobbys[0].title
                hobbyViewCtl.hobbyTwoTitle = person.hobbys[1].title
                hobbyViewCtl.hobbyThreeTitle = person.hobbys[2].title
                
                hobbyViewCtl.hobbyOneDetail = person.hobbys[0].detail
                hobbyViewCtl.hobbyTwoDetail = person.hobbys[1].detail
                hobbyViewCtl.hobbyThreeDetail = person.hobbys[2].detail
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction func loginButtonTapped() {
                
        guard let introductionUsername = userNameTF.text else { return }
        guard let introductionPassword = userPasswordTF.text else { return }

        if !User.userFound(login: introductionUsername, password: introductionPassword) {
                        
            presentAlert(title: "Log In is failed",
                         message: "Wrong username or password",
                         alertaction: UIAlertAction(title: "Ok", style: .default))
            
        }
    }
    
    @IBAction func forgotUserNameButton() {
        
        presentAlert(title: "Your user name is",
                     message: "'mimi'",
                     alertaction: UIAlertAction(title: "Ok", style: .default))
        
    }
    
    @IBAction func forgotPasswordButton() {
        
        let alertaction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.userPasswordTF.text = ""
        }
        
        presentAlert(title: "Your password is",
                     message: "'mumu'",
                     alertaction: alertaction)
        
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        userPasswordTF.text = ""
    }
    

    // MARK: - Private Methods
    private func presentAlert(title: String, message: String, alertaction: UIAlertAction) {
        
        let alertCtl = UIAlertController(title: title,
                                         message: message,
                                         preferredStyle: .alert
        )
        
        alertCtl.addAction(alertaction)
        self.present(alertCtl, animated: true)
        
    }
}
    
// MARK: - extension the logic of the "return" button
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
