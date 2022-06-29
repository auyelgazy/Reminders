//
//  NewReminderViewController.swift
//  Reminders
//
//  Created by Kuanysh Auyelgazin on 24.06.2022.
//

import UIKit

class NewReminderViewController: UIViewController, DataEnteredDelegate {
    
    var chosenList: List?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var chosenListOutlet: UIButton!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        textField.becomeFirstResponder()
    }
    
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        
        if !textField.text!.isEmpty {
            
            
            let newReminder = Reminder(context: self.context)
            newReminder.title = textField.text!
            newReminder.isDone = false
            newReminder.parentList = chosenList
//            newReminder.parentList = chosenList ?? List(context: context)
//            newReminder.parentList?.name = chosenList?.name ?? "All"
            newReminder.parentList?.totalReminders += 1
            saveReminder()
        }
    }
    
    func saveReminder() {
        do {
            try context.save()
        } catch {
            print("! ! ! Error occured while trying to SAVE reminders: \(error)")
        }
        self.dismiss(animated: true)
    }
    
    @IBAction func listPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToLists", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToLists", let listVC = segue.destination as? ChooseListViewController  {
            listVC.delegate = self
        }
    }
    
    func userDidChooseList(list: List?) {
        chosenList = list
        chosenListOutlet.setTitle(chosenList?.name, for: .normal)
        navigationController?.popToRootViewController(animated: true)
    }
}
