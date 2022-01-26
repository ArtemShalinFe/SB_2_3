//
//  HobbyViewController.swift
//  SB_2_3
//
//  Created by Артем ШАЛИН on 25.01.2022.
//

import UIKit

class HobbyViewController: UIViewController {

    @IBOutlet var hobbyOneTitleLabel: UILabel!
    @IBOutlet var hobbyTwoTitleLabel: UILabel!
    @IBOutlet var hobbyThreeTitleLabel: UILabel!
    
    @IBOutlet var hobbyOneDetailLabel: UILabel!
    @IBOutlet var hobbyTwoDetailLabel: UILabel!
    @IBOutlet var hobbyThreeDetailLabel: UILabel!
    
    var hobbyOneTitle = ""
    var hobbyTwoTitle = ""
    var hobbyThreeTitle = ""
    
    var hobbyOneDetail = ""
    var hobbyTwoDetail = ""
    var hobbyThreeDetail = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hobbyOneTitleLabel.text = hobbyOneTitle
        hobbyTwoTitleLabel.text = hobbyTwoTitle
        hobbyThreeTitleLabel.text = hobbyThreeTitle
        
        hobbyOneDetailLabel.text = hobbyOneDetail
        hobbyTwoDetailLabel.text = hobbyTwoDetail
        hobbyThreeDetailLabel.text = hobbyThreeDetail
        
    }

}
