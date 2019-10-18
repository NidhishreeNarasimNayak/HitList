//
//  Person+CoreDataProperties.swift
//  HitList
//
//  Created by Nidhishree on 18/10/19.
//  Copyright © 2019 YML. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?

}
