//
//  AboutMeViewController.swift
//  SB_2_3
//
//  Created by Артем ШАЛИН on 25.01.2022.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet var aboutMeLabel: UILabel!
    
    var aboutMe = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        aboutMeLabel.text = aboutMe
    }

}
