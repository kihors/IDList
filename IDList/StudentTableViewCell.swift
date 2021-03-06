//
//  StudentTableViewCell.swift
//  IDList
//
//  Created by Ihor Kostiv on 11.03.2020.
//  Copyright © 2020 Ihor Kostiv. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var viewCellContent: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
