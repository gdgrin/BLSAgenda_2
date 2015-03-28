//
//  AssignmentCell.swift
//  BLSAgenda
//
//  Created by Gene Grinberg on 3/23/15.
//  Copyright (c) 2015 Gene Grinberg. All rights reserved.
//

import UIKit

class AssignmentCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
