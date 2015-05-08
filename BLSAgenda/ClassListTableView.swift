//
//  ClassListTableView.swift
//  BLSAgenda
//
//  Created by Gene Grinberg on 3/29/15.
//  Copyright (c) 2015 Gene Grinberg. All rights reserved.
//

import UIKit
import CoreData

class ClassListTableView: UITableViewController {

    var classList: [Class]!
    var index: Int!

    
    @IBAction func cancelToListClass(segue: UIStoryboardSegue){
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func saveClassDetail(segue: UIStoryboardSegue){
        
//        let addClassDetailTable = segue.sourceViewController as AddClassDetailTable
//        
//        let appDelegate = UIApplication.sharedApplication().delegate! as AppDelegate
//        let context = appDelegate.managedObjectContext!
//        let newClass: Class = NSEntityDescription.insertNewObjectForEntityForName("Class", inManagedObjectContext: context) as Class
//        newClass.name = addClassDetailTable.classNameTextField.text
//        newClass.color = addClassDetailTable.colorLabel.text!
//        
//        //add the new assignment to the assignmentList array
//        classList.append(newClass)
//        
//        //update the tableView
//        let indexPath = NSIndexPath(forRow: classList.count-1, inSection: 0)
//        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
//        
//        //hide the detail view controller
//        dismissViewControllerAnimated(true, completion: nil)
//        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return classList.count
    }
    
    @IBAction func addClassToList(segue: UIStoryboardSegue) {
//        if let navController = self.navigationController {
//            let root = navController.viewControllers.first as ClassesViewController
//            root.allAssignments[index] = assignmentList
//            
//            navController.popViewControllerAnimated(true)
//        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ClassCell", forIndexPath: indexPath) as ClassCell
        
        let classes = classList[indexPath.row] as Class
        cell.classNameLabel.text = classes.name
        cell.colorNameLabel.text = classes.color //
        
        return cell
    }

    @IBAction func classUnwindSegue(sender: AnyObject) {
        
    }
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
