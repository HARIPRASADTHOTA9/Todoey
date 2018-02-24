//
//  ViewController.swift
//  Todoey
//
//  Created by THOTA HARIPRASAD on 22/02/18.
//  Copyright © 2018 THOTA HARIPRASAD. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    let defaults = UserDefaults.standard
    
   var itemArray = ["hari","ravi","srinu"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "ToDoList Array") as? [String] {
            itemArray = items
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
       let alert = UIAlertController.init(title: "Add New Todoey", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction.init(title: "Add Item", style: .default) { (action) in
//            what will happen when we click add item
           self.itemArray.append(textField.text!)
            self.defaults.set(self.itemArray, forKey: "ToDoList Array")
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "enter new"
            textField = alertTextField
        }
        present(alert, animated: true, completion: nil)
    }
    
}

