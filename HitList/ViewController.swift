//
//  ViewController.swift
//  HitList
//
//  Created by Nidhishree on 15/10/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit
import CoreData
//new comment
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    ///mutable array holding string values to be displayed on tableView
    var people: [NSManagedObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        ///set title of navigation bar itrm
        title = "The List"
    }
    //fetching from core data
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        do {
            people = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
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
        
            self.save(name: nameToSave)
            //self.names.append(nameToSave)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: false)
        
    }
    func save(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        //NSManagedObjectContext allows to insert, save and retrieve NSManaged Objects from database.
        let managedContext = appDelegate.persistentContainer.viewContext
        // create an object
        guard  let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext) else { return }
        //saving new ManagedObject in core data
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        //setting the attributes of the managed object
        person.setValue(name, forKey: "name")
        
        
        do { //saving the info to disk
            try managedContext.save()
            people.append(person)
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = people[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HitListCell.self), for: indexPath) as? HitListCell else { return HitListCell() }
        //match the cells with corresponding NSObject
        cell.textLabel?.text = person.value(forKey: "name") as? String
        return cell
    }
    
    
}

