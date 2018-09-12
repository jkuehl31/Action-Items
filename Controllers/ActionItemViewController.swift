//
//  ViewController.swift
//  Action Items
//
//  Created by John Kuehl on 7/16/18.
//  Copyright © 2018 Winners Win. All rights reserved.
//

import UIKit

class ActionItemViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Read"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Work Out"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Journal"
        itemArray.append(newItem3)
        
        
        if let items = defaults.array(forKey: "ActionItemArray") as? [Item] { itemArray = items
    
            
        }
    
    }

//MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ActionItemCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActionItemCell", for: indexPath)
        
        cell.textLabel?.text = item.title
        
        //Teernary operator ==>
        // value = condition ? valueIfTrue : valueIfFales
        
        cell.accessoryType = item.done ? .checkmark : .none

        
        //if Item.done == true {
           // cell.accesoryType = .checkmark
       // } else {
        //    cell.accessoryType = .none
       // }
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done == false {
            itemArray[indexPath.row].done = true
            { else {
               itemArray[indexPath.row].done = false
                }
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "add New Action Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button.
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "ActionItemArray")
            
            self.tableView.reloadData()
          
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Action Item"
            textField = alertTextField
            
         
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

