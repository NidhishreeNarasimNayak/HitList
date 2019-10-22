//
//  User+CoreDataProperties.swift
//  HitList
//
//  Created by Nidhishree on 21/10/19.
//  Copyright © 2019 YML. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var age: Int16
    @NSManaged public var name: String?

}
