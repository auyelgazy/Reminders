//
//  ViewController.swift
//  Reminders
//
//  Created by Kuanysh Auyelgazin on 23.06.2022.
//

import UIKit
import CoreData

class ListsViewController: UIViewController {
    
    
    var lists = [List]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadLists()
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.listCellIdentifier)
    }
    
    @IBAction func addListPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "New List", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add new list", style: .default) { (action) in
            
            if !textField.text!.isEmpty {
                let newList = List(context: self.context)
                newList.name = textField.text!
                self.lists.append(newList)
                self.saveLists()
            }
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "ex. Groceries..."
            textField = alertTextField
        }
        //        alert.addColorPicker(color: color) { color in
        //            // action with selected color
        //        }
        //
        //        alert.show()
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func saveLists() {
        do {
            try context.save()
        } catch {
            print("!!! Error occured while trying to SAVE lists: \(error)")
        }
        tableView.reloadData()
    }
    
    func loadLists() {
        
        let request: NSFetchRequest<List> = List.fetchRequest()
        do {
            lists = try context.fetch(request)
        } catch {
            print("!!! Error occured while trying to LOAD lists: \(error)")
        }
    }
    
}

extension ListsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let list = lists[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.listCellIdentifier, for: indexPath) as! ListTableViewCell
        //                cell.backgroundColor = UIColor.init(named: list.color)
        cell.listTitle.text = list.name
        cell.remindersNumber.text = String(list.totalReminders)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToReminders", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destionationVC = segue.destination as! RemindersViewController
    }
}

