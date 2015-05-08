//
//  NoteViewController.swift
//  BLSAgenda
//
//  Created by Gene Grinberg on 3/28/15.
//  Copyright (c) 2015 Gene Grinberg. All rights reserved.
//

import UIKit
import CoreData

class NoteViewController: UIViewController {

    var labelText: String!
    @IBOutlet weak var noteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteLabel.text = labelText
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
