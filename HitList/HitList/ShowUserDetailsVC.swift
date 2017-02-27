//
//  ShowUserDetailsVC.swift
//  HitList
//
//  Created by MAC on 25/02/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import UIKit

class ShowUserDetailsVC: UIViewController {

		//MARK: Outlets
		//===========
		@IBOutlet weak var showDataTable: UITableView!
	
		//MARK: Instances
		//===========
	
		var people = Person()
	
		var dbHelper = DBhelper()
	
		//MARK: Variables
		//============
	
    let fields = ["Name","Age","Email","Gender"]
	
		var isPreviewModeOn = Bool()
	
		var personIndex = Int()
	
	//MARK: View Life Cycle 
	//================
    override func viewDidLoad() {
      
					super.viewDidLoad()
      
					self.doSubViewLoad()
			
			}
	
	
  private func doSubViewLoad() {
  
					showDataTable.delegate = self
				
					showDataTable.dataSource = self
		
					if !isPreviewModeOn		{
				
							self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action:
			
							#selector(doneButtonTapped(_:) ))
		
				}
		
					let listcellnib = UINib(nibName: "ContentViewCell", bundle: nil)
				
					showDataTable.register(listcellnib, forCellReuseIdentifier: "ContentCellID")
  
		}

    override func didReceiveMemoryWarning() {
      
					super.didReceiveMemoryWarning()
      
		}

}

//MARK: TableView Delegates , DataSources , TextField Delegate
//==============================================

extension ShowUserDetailsVC : UITableViewDelegate, UITableViewDataSource ,UITextFieldDelegate {

	
	func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
    
					return fields.count
		
		}
  
  func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
				guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCellID",for: indexPath) as? ContentViewCell
      
					else {
       
						fatalError("No Cell Found")
        
		}
    
				cell.inputTypeLabel.text = fields[indexPath.row]
		
				cell.inputTextField.delegate = self
    
				switch indexPath.row {
			
										case 0 : cell.inputTextField.text = people.name
			
										case 1 :	cell.inputTextField.text  = "\(people.age)"
			
										case 2 : cell.inputTextField.text = people.email
			
										case 3 : cell.inputTextField.text  = people.gender
			
										default : print("Wrong Type Value")

							}
		
				if isPreviewModeOn {
			
						cell.inputTextField.isEnabled = false
		
				}
    
				return cell
    
		}
	
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
  
				return 100.0
    
  }
	
	//MARK: textField Delegates
	//====================
	func textFieldDidEndEditing(_ textField: UITextField){
		
				let cell =  textField.superview?.superview as? ContentViewCell
		
				guard let index = showDataTable.indexPath(for: (cell)!) else {   return   }
		
				guard let  cellData = textField.text else {   return   }
		
				switch index.row  {
			
								case 0 : people.name = cellData
			
								case 1 :  people.age = (Int16(cellData)) ?? 0
			
								case 2 : people.email = cellData
			
								case 3 : people.gender = cellData
			
								default : print("Wrong Type Value")
			
					}
		
		}
	
	//MARK: doneButtonTapped
	//===================
	func doneButtonTapped(_ sender : UIBarButtonItem) {
		
				print("done tapped")
		
				showDataTable.endEditing(true)
		
				dbHelper.editAtPerson(people,personIndex)
		
				showDataTable.reloadData()
		
				self.navigationController?.popViewController(animated: true)
		
	}

}

