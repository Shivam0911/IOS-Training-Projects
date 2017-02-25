//
//  Person+CoreDataProperties.swift
//  HitList
//
//  Created by MAC on 24/02/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person");
    }

    @NSManaged public var name: String?
  
    @NSManaged public var age: Int16
  
    @NSManaged public var email: String?
  
    @NSManaged public var gender: String?

}
