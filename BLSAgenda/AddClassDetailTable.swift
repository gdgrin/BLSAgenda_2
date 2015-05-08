//
//  AddClassDetailTable.swift
//  BLSAgenda
//
//  Created by Gene Grinberg on 3/29/15.
//  Copyright (c) 2015 Gene Grinberg. All rights reserved.
//

import UIKit

class AddClassDetailTable: UITableViewController {

    @IBOutlet weak var classNameTextField: UITextField!
    @IBOutlet weak var colorLabel: UILabel!
    
    var color:String = "White"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorLabel.text = color
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    @IBAction func selectedColor(segue:UIStoryboardSegue) {
        let colorPickerTableView = segue.sourceViewController as ColorPickerTableView
        if let selectedColor = colorPickerTableView.selectedColor {
            colorLabel.text = selectedColor
            color = selectedColor
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            classNameTextField.becomeFirstResponder()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveClassDetail" {
            // class = Class(name: classNameTextField.text, color:color)
        }
        if segue.identifier == "PickColor" {
          let colorPickerTableView = segue.destinationViewController as ColorPickerTableView
            colorPickerTableView.selectedColor = color
        }
    }

}
