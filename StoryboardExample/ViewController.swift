//
//  ViewController.swift
//  StoryboardExample
//
//  Created by Gak_ee on 2020/01/27.
//  Copyright © 2020 Gak_eee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        DispatchQueue.main.async {
            Thread.sleep(until: Date(timeIntervalSince1970: 3))
            self.showTabBarController(self)
        }
    }
    

    @IBAction func showTabBarController(_ sender : Any){
        self.performSegue(withIdentifier: "TabBarController", sender: sender)
    }
    
    @IBAction func unwindViewController(_ segue : UIStoryboardSegue){
        print("unwind Intro!")
    }
}

