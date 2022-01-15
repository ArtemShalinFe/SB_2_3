//
//  WelcomeViewController.swift
//  SB_2_3
//
//  Created by Артем ШАЛИН on 13.01.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var usernameLabel: UILabel!
    
    var username = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = username;
        
    }

}
