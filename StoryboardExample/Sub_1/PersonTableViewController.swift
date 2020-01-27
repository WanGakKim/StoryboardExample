//
//  PersonTableViewController.swift
//  StoryboardExample
//
//  Created by Gak_ee on 2020/01/28.
//  Copyright © 2020 Gak_eee. All rights reserved.
//

import Foundation
import UIKit

class PersonTableViewController : UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PersonTableCell.instanceFromNib()
        
        return cell
    }
}


class PersonTableCell: UITableViewCell {
    
    @IBOutlet weak var personTitleImageView: UIImageView!
    @IBOutlet weak var personTitleLabel: UILabel!
    
    class func instanceFromNib() -> PersonTableCell {
        let personTableCell = UINib(nibName: "PersonTableCell", bundle: .main).instantiate(withOwner: nil, options: nil)[0] as! PersonTableCell
        personTableCell.didloadNib()
        return personTableCell
    }
    
    private func didloadNib(){
        
    }
}
