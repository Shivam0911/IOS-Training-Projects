//
//  DBhelper.swift
//  HitList
//
//  Created by MAC on 24/02/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DBhelper   {
  
  var people = [Person]()
  
  var name : String
  
  var age : Int
  
  var email : String
  
  var gender : String
  
  init() {
    
     name = ""
    
     age = 0
    
     email = ""
    
     gender = ""

  }
  
  init(withName name : String , withAge age : Int , withEmail email : String , withGender gender : String) {
    
    self.name = name
    
    self.age = age
    
    self.email = email
    
    self.gender = gender
  }
  
  func saveData() {
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let entity = NSEntityDescription.entity(forEntityName: "Person" , in: managedContext)!
    
    let person = Person(entity: entity , insertInto: managedContext)
    
    person.name = name
    
    person.age =  Int16(age)
    
    person.email = email
    
    person.gender = gender
    
    do {
      
      try managedContext.save()
      
      people.append(person)
      
    } catch let error as NSError {
      
      print("Could not save. \(error), \(error.userInfo)")
      
    }
    
  }

  func getData(){
  
  guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
  
    fatalError("no Delegate !")
    
  }
  
  let managedContext = appDelegate.persistentContainer.viewContext
  
  let fetchRequest : NSFetchRequest<Person> = Person.fetchRequest()
  
  do {
  
  people = try managedContext.fetch(fetchRequest)
  
  }
  catch let error as NSError {
  
  print("Could not fetch. \(error), \(error.userInfo)")
    
    }
  
  }
  
  func deleteData(_ deleteSpecificData : Person) {
  
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      
      fatalError("no Delegate !")
      
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    managedContext.delete(deleteSpecificData)
   
    do {
			
      try managedContext.save()
			
    }
		catch _ {
			
    }
  
  }
	
	func editAtPerson(_ atPerson : Person )		{
	
	
	}
  
  
}
