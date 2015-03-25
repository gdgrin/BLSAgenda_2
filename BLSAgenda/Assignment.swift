//
//  Assignment.swift
//  BLSAgenda
//
//  Created by Gene Grinberg on 3/16/15.
//  Copyright (c) 2015 Gene Grinberg. All rights reserved.
//

import Foundation
import CoreData

class Assignment: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var dueDate: NSDate
    @NSManaged var category: String
    @NSManaged var text: String

}
