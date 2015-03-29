//
//  ViewController.swift
//  BLSAgenda
//
//  Created by Gene Grinberg on 3/12/15.
//  Copyright (c) 2015 Gene Grinberg. All rights reserved.
//

import UIKit
import CoreData

class ClassesViewController: UIViewController {

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
    var sb1Assignments = [Assignment]()
    var sb2Assignments = [Assignment]()
    var sb3Assignments = [Assignment]()
    var sb4Assignments = [Assignment]()
    var sb5Assignments = [Assignment]()
    var sb6Assignments = [Assignment]()
    var sb7Assignments = [Assignment]()
    var sb8Assignments = [Assignment]()
    var sb9Assignments = [Assignment]()
    
    var allAssignments = [[Assignment]]()
    
    var first = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if first {
            subjectButtons.append(sb1)
            subjectButtons.append(sb2)
            subjectButtons.append(sb3)
            subjectButtons.append(sb4)
            subjectButtons.append(sb5)
            subjectButtons.append(sb6)
            subjectButtons.append(sb7)
            subjectButtons.append(sb8)
            subjectButtons.append(sb9)
        
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
        
        println("from clas's view did load")
        for i in allAssignments {
            println("this subject")
            for j in i {
                println(j.name)
            }
        }
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
                        println("found match and assigning")
                        let matchedAssignments = allAssignments[i]
                        dst.assignmentList = matchedAssignments
                        dst.index = i
                        
                        println("going from class's segue")
                        for ma in matchedAssignments {
                            println(ma)
                        }
                        println(i)
                        dst.title = "7"
                        // assign assignment view controller's index and assignment array to appropriate values
                    }
                }
            }
        }
    }
    
 
}

