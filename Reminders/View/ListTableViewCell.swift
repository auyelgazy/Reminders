//
//  ListTableViewCell.swift
//  Reminders
//
//  Created by Kuanysh Auyelgazin on 24.06.2022.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var listTitle: UILabel!
    @IBOutlet weak var remindersNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
