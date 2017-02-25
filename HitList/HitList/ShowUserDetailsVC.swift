//
//  ShowUserDetailsVC.swift
//  HitList
//
//  Created by MAC on 25/02/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import UIKit

class ShowUserDetailsVC: UIViewController {

    @IBOutlet weak var showDataTable: UITableView!
	
		var people = Person()
  
    let fields = ["Name","Age","Email","Gender"]
  
    override func viewDidLoad() {
      
      super.viewDidLoad()
      
      self.doSubViewLoad()

        }
  
  private func doSubViewLoad() {
  
  showDataTable.delegate = self
    
  showDataTable.dataSource = self
   
  let listcellnib = UINib(nibName: "ContentViewCell", bundle: nil)
    
  showDataTable.register(listcellnib, forCellReuseIdentifier: "ContentCellID")

  
  }

    override func didReceiveMemoryWarning() {
      
      super.didReceiveMemoryWarning()
      
  }

}

extension ShowUserDetailsVC : UITableViewDelegate, UITableViewDataSource  {

  func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
    
    return 4
  }
  
  func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCellID",for: indexPath) as? ContentViewCell
      
      else {
       
        fatalError("No Cell Found")
        
    }
    
    cell.inputTypeLabel.text = fields[indexPath.row]
    
		switch indexPath.row {
			
					case 0 : cell.inputTextField.text = people.name
			
					case 1 :cell.inputTextField.text  = "\(people.age)"
			
					case 2 : cell.inputTextField.text = people.email
			
					case 3 : cell.inputTextField.text  = people.gender
			
					default : print("Wrong Type Value")

		}
    
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
  
  return 100.0
    
  }


}

