//
//  RemindersViewController.swift
//  Reminders
//
//  Created by Kuanysh Auyelgazin on 27.06.2022.
//

import UIKit
import CoreData

class RemindersViewController: UIViewController {
    
    var reminders = [Reminder]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var selectedList: List? {
        didSet {
//            loadItems()
        }
    }

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

   
}

extension RemindersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.reminderCellIdentifier, for: indexPath)
        cell.textLabel?.text = reminders[indexPath.row].title
        cell.accessoryType = reminders[indexPath.row].isDone ? .checkmark : .none
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        reminders[indexPath.row].isDone = !reminders[indexPath.row].isDone
//        saveItems()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
