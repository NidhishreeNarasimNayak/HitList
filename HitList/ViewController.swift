//
//  ViewController.swift
//  HitList
//
//  Created by Nidhishree on 15/10/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    ///mutable array holding string values to be displayed on tableView
    var people: [NSManagedObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        ///set title of navigation bar itrm
        title = "The List"
    }
    //Implement the addName IBAction
    @IBAction func addName(_ sender: UIBarButtonItem) {
let alert = UIAlertController(title: "New Name", message: "Add a new name", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] (action) in
           // print(alert.textFields?.count)
            //refers to which textField we are accessing from the textField array
            guard let textField = alert.textFields?.first,  //refers to the text of the first text field
                let nameToSave = textField.text else {
                    return
            }
           // self.save(name: nameToSave)
            //self.names.append(nameToSave)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: false)
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = people[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HitListCell.self), for: indexPath) as? HitListCell else { return HitListCell() }
        cell.textLabel?.text = person.value(forKey: "name") as? String
        return cell
    }
    
    
}

