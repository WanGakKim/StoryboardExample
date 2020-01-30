//
//  PersonDetailViewController.swift
//  StoryboardExample
//
//  Created by Gak_ee on 2020/01/28.
//  Copyright © 2020 Gak_eee. All rights reserved.
//

import Foundation
import UIKit

class PersonDetailViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    
    var person : Person? {
        didSet{
            profileImageView.image = person?.image
            titleLabel.text = person?.title
            contentTextView.text = person?.content
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backToIntro(_ sender: Any){
        // 1. navigation 통해 rootView 로 가기
//        self.navigationController?.popToRootViewController(animated: true)
        // 2. unwind 통해 Intro 화면 가기
        performSegue(withIdentifier: "unwindViewController", sender: self)
    }
}
