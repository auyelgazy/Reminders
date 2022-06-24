//
//  NewReminderViewController.swift
//  Reminders
//
//  Created by Kuanysh Auyelgazin on 24.06.2022.
//

import UIKit

class NewReminderViewController: UIViewController {
    
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
        
        if let text = textField.text {
            print(text)
        }
    }
    
    @IBAction func listPressed(_ sender: UIButton) {
    }
    
}
