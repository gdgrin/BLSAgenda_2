//
//  AssignmentTableViewController.swift
//  BLSAgenda
//
//  Created by Gene Grinberg on 3/16/15.
//  Copyright (c) 2015 Gene Grinberg. All rights reserved.
//


// accepts array and populates data table accordingly
// on segue passes back updated array of objects to the class view controller
// --> This will enable the class view controller to update the core data as necessary

import UIKit
import CoreData
import Foundation

class AssignmentTableViewController: UITableViewController {

    var assignmentList: [Assignment]!
    var index: Int!
    var noteIndex = 0

    
    @IBAction func cancelToAssignmentViewController(segue: UIStoryboardSegue) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveAssignmentDetail(segue: UIStoryboardSegue) {
       
        let assignmentDetailTableController = segue.sourceViewController as AssignmentDetailTableController
        
//        let newAssignment = Assignment()
        let appDelegate = UIApplication.sharedApplication().delegate! as AppDelegate
        let context = appDelegate.managedObjectContext!
        let newAssignment: Assignment = NSEntityDescription.insertNewObjectForEntityForName("Assignment", inManagedObjectContext: context) as Assignment
        newAssignment.name = assignmentDetailTableController.nameTextField.text
        newAssignment.dueDate = assignmentDetailTableController.dateTextField.date
        newAssignment.text = assignmentDetailTableController.noteTextField.text
        newAssignment.category = index
        
        //add the new assignment to the assignmentList array
        assignmentList.append(newAssignment)
        
        println("in save assignemnt detail function")
        println(newAssignment.name)
        
        //update the tableView
        let indexPath = NSIndexPath(forRow: assignmentList.count-1, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
        let rootvc = self.navigationController?.viewControllers.first as ClassesViewController
        rootvc.allAssignments[index] = assignmentList
        
        //hide the detail view controller
        dismissViewControllerAnimated(true, completion: nil)
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
        return assignmentList.count
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AssignmentCell", forIndexPath: indexPath) as AssignmentCell
        
        let assignments = assignmentList[indexPath.row] as Assignment
        cell.nameLabel.text = assignments.name
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let s = dateFormatter.stringFromDate(assignments.dueDate)
        cell.dueDateLabel.text = s // assignments.dueDate.description
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        noteIndex = indexPath.row
    }

    
    @IBAction func unwindSegue(sender: AnyObject) {
        if let navController = self.navigationController {
            let root = navController.viewControllers.first as ClassesViewController
            root.allAssignments[index] = assignmentList
            
            navController.popViewControllerAnimated(true)
        }
    }
    

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    func fetchLog() {
        let fetchRequest = NSFetchRequest(entityName: "Assignment")
        
        // Create a sort descriptor object that sorts on the "title"
        // property of the Core Data object
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        // Set the list of sort descriptors in the fetch request,
        // so it includes the sort descriptor
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Assignment] {
            assignmentList = fetchResults
        }
    }
    
    
    // Override to support editing the table view.
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            println("deleting at index:")
//            println(indexPath.row)
//            println(assignmentList)
//            let logItemToDelete = assignmentList[indexPath.row]
//            
//            // Delete it from the managedObjectContext
//            assignmentList.removeAtIndex(indexPath.row)
//            // Refresh the table view to indicate that it's deleted
//            // self.fetchLog()
//           
//            // Tell the table view to animate out that row
//            println("deleting")
//            // tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
//            // tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//            println("Deleted")
//        }
//        else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
    

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

    
    // MARK: - Navigation

    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "NoteSegue" {
            println("Note segue triggered")
            println(assignmentList[noteIndex].text)
            let dst = segue.destinationViewController as NoteViewController
            dst.labelText = assignmentList[noteIndex].text
        }
    }

}
