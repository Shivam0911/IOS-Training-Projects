
//
//  SignUpVC.swift
//  HitList
//
//  Created by MAC on 24/02/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController  {
  
  //MARK: Outlets
  //============
  
  @IBOutlet weak var signUpTableView: UITableView!
  
  //MARK: Variables
  //=============
  
  let fields = ["Name","Age","Email","Gender"]
    
  let dbHelper = DBhelper()
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    self.doSubViewLoad()
    
  }
  
  private func doSubViewLoad()  {
    
    self.automaticallyAdjustsScrollViewInsets = false
    
    signUpTableView.dataSource = self
    
    signUpTableView.delegate = self
    
    let listcellnib = UINib(nibName: "ContentViewCell", bundle: nil)
    
    signUpTableView.register(listcellnib, forCellReuseIdentifier: "ContentCellID")
    
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action:
      
    #selector(doneButtonTapped(_:) ))

  }
  
  override func didReceiveMemoryWarning() {
    
    super.didReceiveMemoryWarning()
    
  }
  
}


// MARK: - UITableViewDataSource
//=========================
extension SignUpVC : UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {
  
  func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
    
    return 4
  }
  
  func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    //let person = people[indexPath.row]
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCellID",for: indexPath) as? ContentViewCell
      
      else {
        
        fatalError("No Cell Found")
        
    }
    
    cell.inputTypeLabel.text = fields[indexPath.row]
    
    cell.inputTextField.delegate = self
    
    return cell
    
  }
  
  //MARK: textField Delegates
  //====================
  func textFieldDidEndEditing(_ textField: UITextField){
    
		let cell =  textField.superview?.superview as? ContentViewCell
    
    guard let index = signUpTableView.indexPath(for: (cell)!) else {   return   }

    
    guard let  cellData = textField.text else {   return   }
    
    switch index.row  {
      
				case 0 : dbHelper.name = cellData
			
				case 1 :  dbHelper.age = (Int(cellData)) ?? 0
			
				case 2 : dbHelper.email = cellData
			
				case 3 : dbHelper.gender = cellData
				
				default : print("Wrong Type Value")
			
    }
    
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
    
    return 100.0
    
  }
  
}

extension SignUpVC {
  
  func doneButtonTapped(_ sender : UIBarButtonItem) {
    
    print("done tapped")
		
    signUpTableView.endEditing(true)
		
    dbHelper.saveData()
    
    signUpTableView.reloadData()
    
  }
  
}

