//
//  ViewController.swift
//  BLSAgenda
//
//  Created by Gene Grinberg on 3/12/15.
//  Copyright (c) 2015 Gene Grinberg. All rights reserved.
//

import UIKit
import CoreData
import Foundation


class ClassesViewController: UIViewController {
    
    var classList = [Class]()

    @IBOutlet weak var sb1: UIButton!
    @IBOutlet weak var sb2: UIButton!
    @IBOutlet weak var sb3: UIButton!
    @IBOutlet weak var sb4: UIButton!
    @IBOutlet weak var sb5: UIButton!
    @IBOutlet weak var sb6: UIButton!
    @IBOutlet weak var sb7: UIButton!
    @IBOutlet weak var sb8: UIButton!
    @IBOutlet weak var sb9: UIButton!
    var subjectButtons = [UIButton]()
    
    // essentially a big matrix of the assignemnts
//    var sb1Assignments = [Assignment]()
//    var sb2Assignments = [Assignment]()
//    var sb3Assignments = [Assignment]()
//    var sb4Assignments = [Assignment]()
//    var sb5Assignments = [Assignment]()
//    var sb6Assignments = [Assignment]()
//    var sb7Assignments = [Assignment]()
//    var sb8Assignments = [Assignment]()
//    var sb9Assignments = [Assignment]()
    
    var allAssignments: [[Assignment]]!
    
    var first = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("in class view's view did load")
        
        subjectButtons.append(sb1)
        subjectButtons.append(sb2)
        subjectButtons.append(sb3)
        subjectButtons.append(sb4)
        subjectButtons.append(sb5)
        subjectButtons.append(sb6)
        subjectButtons.append(sb7)
        subjectButtons.append(sb8)
        subjectButtons.append(sb9)
        
        if first {
            allAssignments = [[Assignment]]()
            var sb1Assignments = [Assignment]()
            var sb2Assignments = [Assignment]()
            var sb3Assignments = [Assignment]()
            var sb4Assignments = [Assignment]()
            var sb5Assignments = [Assignment]()
            var sb6Assignments = [Assignment]()
            var sb7Assignments = [Assignment]()
            var sb8Assignments = [Assignment]()
            var sb9Assignments = [Assignment]()
            
            allAssignments.append(sb1Assignments)
            allAssignments.append(sb2Assignments)
            allAssignments.append(sb3Assignments)
            allAssignments.append(sb4Assignments)
            allAssignments.append(sb5Assignments)
            allAssignments.append(sb6Assignments)
            allAssignments.append(sb7Assignments)
            allAssignments.append(sb8Assignments)
            allAssignments.append(sb9Assignments)
            first = false
        }
        
        for i in subjectButtons {
//            i.hidden = true
        }
        
        // load stored stuff from core data
        loadAssignments()
        loadClassButtons()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // all the buttons have a segue called "AssignmentSegue" so they perform the same actions when called
        if segue.identifier != nil {
            let segueIdentifier = segue.identifier!
            if segueIdentifier.rangeOfString("AssignmentSegue") != nil {
                // downcast the sender to appropriate thing, find its index relative to the subject buttons
                //                let dst = segue.destinationViewController as AssignmentTableViewController
                
                let dst = segue.destinationViewController as AssignmentTableViewController
                
                // get the current sender's appropriate index
                
                let senderButton = sender as UIButton

                for i in 0 ... subjectButtons.count - 1 {
                    
                    if (subjectButtons[i] == senderButton) {
                        // found match
                        let matchedAssignments = allAssignments[i]
                        dst.assignmentList = matchedAssignments
                        dst.index = i
                        
//                        dst.title = "" put class name
                        // assign assignment view controller's index and assignment array to appropriate values
                    }
                }
            }
        }
    }
    
    func loadAssignments() {
        let appDelegate =
        UIApplication.sharedApplication().delegate as AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName:"Assignment")
        
        var error: NSError?
        
        let fetchedResults =
        managedContext.executeFetchRequest(fetchRequest,
            error: &error) as [Assignment]?
        
//        if let results = fetchedResults {
//            assignmentList = results
//            
//        }
        
        for i in fetchedResults! {
            allAssignments[i.category].removeAll(keepCapacity: false)
            allAssignments[i.category].append(i)
        }
        
        if let tmp = fetchedResults {
            println("assignment fetch successful")
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }

    }
    
    func loadClassButtons() {
        // retrieve any existing from core data and repopulate the classList
    }
    
    @IBAction func updateCoreAssignments(segue: UIStoryboardSegue) {
        println("in the update core method")
        let appDelegate =
        UIApplication.sharedApplication().delegate as AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
//        println(allAssignments)
//        println(allAssignments.count)
//        for i in allAssignments {
//            println(i)
//        }
        
        for iter1 in allAssignments {
            for iter2 in iter1 {
                let entity = NSEntityDescription.entityForName("Assignment", inManagedObjectContext: managedContext)
                let assignment = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
                let currentIterationValue = iter2
                assignment.setValue(iter2.name, forKey: "name")
                assignment.setValue(iter2.dueDate, forKey: "dueDate")
                assignment.setValue(iter2.text, forKey: "text")
                assignment.setValue(iter2.category, forKey: "category")
                
                println("save function triggered for \(iter2.name)")
                
                var error: NSError?
                if !managedContext.save(&error) {
                    println("Could not save \(error), \(error?.userInfo)")
                }
            }
        }
//        let entity =  NSEntityDescription.entityForName("Assignment",
//            inManagedObjectContext:
//            managedContext)
//        
//        let assignment = NSManagedObject(entity: entity!,
//            insertIntoManagedObjectContext:managedContext)
//        
//        assignment.setValue(name, forKey: "name")
//        
//        
//        var error: NSError?
//        if !managedContext.save(&error) {
//            println("Could not save \(error), \(error?.userInfo)")
//        }
//        assignmentList.append(assignment)
    }
 
}

