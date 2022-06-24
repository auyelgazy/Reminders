//
//  ViewController.swift
//  Reminders
//
//  Created by Kuanysh Auyelgazin on 23.06.2022.
//

import UIKit

class RemindersViewController: UIViewController {
    
    var lists: [List] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lists.append(List(name: "Addc", reminders: 1, backgroundColor: .systemRed))
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
    }


}

extension RemindersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let list = lists[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! ListTableViewCell
        
        cell.listTitle.text = list.name
        cell.remindersNumber.text = String(list.reminders)
        return cell
    }
    
    
}

