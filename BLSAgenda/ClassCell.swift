//
//  ClassCell.swift
//  BLSAgenda
//
//  Created by Gene Grinberg on 3/29/15.
//  Copyright (c) 2015 Gene Grinberg. All rights reserved.
//

import UIKit

class ClassCell: UITableViewCell {

    @IBOutlet weak var classNameLabel: UILabel!
    @IBOutlet weak var colorNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
