//
//  ResumeViewController.swift
//  SB_2_3
//
//  Created by Артем ШАЛИН on 25.01.2022.
//

import UIKit

class ResumeViewController: UIViewController {

    
    @IBOutlet var professionLabel: UILabel!
    @IBOutlet var workExpirienceLabel: UILabel!
    @IBOutlet var acivityLabel: UILabel!
    
    var profession = ""
    var workExpirience = 0
    var acivity = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        professionLabel.text = profession
        workExpirienceLabel.text = String(workExpirience)
        acivityLabel.text = acivity
        
    }

}
