//
//  ChooseListViewController.swift
//  Reminders
//
//  Created by Kuanysh Auyelgazin on 27.06.2022.
//

import UIKit
import CoreData

protocol DataEnteredDelegate: AnyObject {
    func userDidChooseList(list: List?)
}

class ChooseListViewController: UIViewController {
    
    var lists = [List]()
    var selectedList: List?
    weak var delegate: DataEnteredDelegate?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLists()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
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

extension ChooseListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let list = lists[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)

        cell.textLabel?.text = list.name
        
        return cell
    }


}

extension ChooseListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedList = lists[indexPath.row]
        delegate?.userDidChooseList(list: selectedList ?? List(context: context))
    }
}
