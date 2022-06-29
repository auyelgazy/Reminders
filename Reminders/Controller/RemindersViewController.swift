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
    var undoneReminders = [Reminder]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var selectedList: List? {
        didSet {
            loadItems()
        }
    }
    var titleText = ""
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = titleText
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func loadItems() {
        let request: NSFetchRequest<Reminder> = Reminder.fetchRequest()
//        request.sortDescriptors = [NSSortDescriptor(key:"isDone", ascending:true)]
        do {
            reminders = try context.fetch(request)
        } catch {
            
        }
    }
    // // // // / / / / / / // / /
//    func loadItems(with request: NSFetchRequest<Reminder> = Reminder.fetchRequest(), predicate: NSPredicate? = nil) {
//
//        let listPredicate = NSPredicate(format: "parentList.name MATCHES %@", selectedList!.name!)
//        if let addtionalPredicate = predicate {
//            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [listPredicate, addtionalPredicate])
//        } else {
//            request.predicate = listPredicate
//        }
//        do {
//            reminders = try context.fetch(request)
//        } catch {
//            print("! ! ! Erorr occured while trying to LOAD reminders: \(error)")
//        }
//    }
    
    func saveItems() {
        do {
            try context.save()
        } catch {
            print("! ! ! Erorr occured while trying to SAVE reminders: \(error)")
        }
        tableView.reloadData()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationVC = segue.destination as! TodoListViewController
//
//        if let indexPath = tableView.indexPathForSelectedRow {
//            destinationVC.selectedCategory = catergories[indexPath.row]
//        }
//    }
    @IBAction func newReminderPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goFromReminders", sender: self)
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
        saveItems()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
