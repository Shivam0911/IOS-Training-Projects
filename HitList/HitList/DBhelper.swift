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
	
	//MARK: Variables 
	//============
  var people = [Person]()
  
  var name : String
  
  var age : Int
  
  var email : String
  
  var gender : String
	
	//MARK: Initializers
	//=============
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

}

extension DBhelper {
	
	//MARK: SaveData Method
	//==================
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

	//MARK: getData Method
	//==================
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
	
	//MARK: deleteData Method
	//===================
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
	
	//MARK: editAtPerson Method
	//=====================
   func editAtPerson(_ atPerson : Person , _ personIndex : Int)		{
	
				guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
			
						fatalError("no Delegate !")
			
				}
  
				let managedContext = appDelegate.persistentContainer.viewContext  
					
				people[personIndex].name = atPerson.name
		
				people[personIndex].email = atPerson.email
		
				people[personIndex].age =	atPerson.age
		
				people[personIndex].gender = atPerson.gender
		
				do{
			
						try managedContext.save()
			
						print("saved")
			
					}catch let error as NSError {
			
							print("Could not save \(error)")
			
				}
		
	}
	
}
