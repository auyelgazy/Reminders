//
//  NewReminderViewController.swift
//  Reminders
//
//  Created by Kuanysh Auyelgazin on 24.06.2022.
//

import UIKit

class NewReminderViewController: UIViewController {
    
    var chosenList = "All"
    
    @IBOutlet weak var chosenListOutlet: UIButton!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        chosenListOutlet.setTitle(chosenList, for: .normal)
        // Do any additional setup after loading the view.
        textField.becomeFirstResponder()
    }
    
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        
        if let text = textField.text {
            print(text)
        }
    }
    
    @IBAction func listPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToLists", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ChooseListViewController
        
        
        
        
//        if let indexPath = tableView.indexPathForSelectedRow {
//            destinationVC.selectedCategory = catergories[indexPath.row]
//        }
    }
}
