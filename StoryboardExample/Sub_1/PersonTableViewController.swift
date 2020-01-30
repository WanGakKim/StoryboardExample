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
    
    var persons : [Person]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.title = "StoryBoard Sub_1 VC"
    }
    
    func initialization(){
        persons = []
        for _ in 0...10{
            let person = Person.init(image: UIImage.init(named: "man"), title: randomString(length: 5), content: randomString(length: 100))
            persons?.append(person)
        }
        tableView.reloadData()
    }
    
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons?.count ?? 0
    }
    //cell setting
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTableCell", for: indexPath) as! PersonTableCell
//        cell.profileImageView.image = persons?[indexPath.row].image
//        cell.titleLabel.text = persons?[indexPath.row].title
//        cell.contentTextView.text = persons?[indexPath.row].content
        cell.person = persons?[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PersonDetailViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "PersonDetailVierController":
            let vc = segue.destination as! PersonDetailViewController
            let cell = sender as! PersonTableCell
            vc.person = cell.person
            return
        default:
            return
        }
    }
}
class PersonTableCell: UITableViewCell {
    
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
    
}
