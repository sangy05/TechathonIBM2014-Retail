//
//  Plan.swift
//  RetailStore
//
//  Created by Sangeeth on 19/11/14.
//  Copyright (c) 2014 Sangeeth. All rights reserved.
//

import Foundation
import CoreData

class Plan: NSManagedObject {

    @NSManaged var planName: String
    @NSManaged var content: String

}
