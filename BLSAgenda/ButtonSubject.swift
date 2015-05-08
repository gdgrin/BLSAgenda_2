//
//  ButtonSubject.swift
//  BLSAgenda
//
//  Created by Gene Grinberg on 3/28/15.
//  Copyright (c) 2015 Gene Grinberg. All rights reserved.
//

import UIKit

class ButtonSubject: UIButton {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.setTitleColor(UIColor.blackColor(), forState: UIControlState.allZeros)
        
    }
    

}
