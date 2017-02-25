
import UIKit
import CoreData

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var dbHelper  = DBhelper()
  
 // var tapGesture = UITapGestureRecognizer()
	
	//var locationCgPoint =		CGPoint()
  
  override func viewDidLoad() {
    
			super.viewDidLoad()

			print(#function)
			
			title = "Users List"
			
			let userListNib = UINib(nibName: "UsersListCell", bundle: nil)
		
			tableView.register(userListNib, forCellReuseIdentifier: "UsersListCellID")
		
//			tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.selectOnTap(_:)))
//			
			tableView.delegate = self
			
//			tapGesture.numberOfTapsRequired = 2
		
    }

  override func viewWillAppear(_ animated: Bool) {
    
			super.viewWillAppear(animated)
    
			print(#function)
    
			dbHelper.getData()
		
			tableView.reloadData()
  }
  
  

  @IBAction func addName(_ sender: UIBarButtonItem) {
    
    //MARK: Navigation Insatantiation
    //========================
    
      let storyBoardScene = UIStoryboard(name: "Main", bundle: Bundle.main)
    
      let navi = storyBoardScene.instantiateViewController(withIdentifier : "SignUpVCID") as! SignUpVC
    
      self.navigationController?.pushViewController(navi, animated: true)  
    
      navi.title = "Signup Form"
  
    }
	
//	 func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
//		
//		let touch = touches.anyObject()! as! UITouch
//		
//		locationCgPoint = touch.location(in: tableView)
//		
//	}

// 
//  func selectOnTap(_ sender :  UITapGestureRecognizer)  {
//		
//		
//		
//  }
	
}


// MARK: - UITableViewDataSource
//========================

extension ViewController: UITableViewDataSource ,UITableViewDelegate{

  func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
    
			print(dbHelper.people.count)
			
			return dbHelper.people.count
    
  }
  

  func tableView(_ tableView: UITableView , cellForRowAt indexPath: IndexPath) -> UITableViewCell {

			let person = dbHelper.people[indexPath.row]
			
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "UsersListCellID", for: indexPath) as? UsersListCell
			
			else	{
				
				fatalError()
		}
			
			cell.userNameLabel.text = person.name
			
			return cell
 
  }
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		
		let row = indexPath.row
		
		let storyBoardScene = UIStoryboard(name: "Main", bundle: Bundle.main)
		
		let navi = storyBoardScene.instantiateViewController(withIdentifier : "ShowUserDetailsVCID") as! ShowUserDetailsVC
		
		self.navigationController?.pushViewController(navi, animated: true)
		
		navi.title = "User Details"
		
		navi.people = dbHelper.people[row]

	}
	
//  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//    
//			return true
//    
//  }
//  
//  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//   
//			if (editingStyle == UITableViewCellEditingStyle.delete) {
//				
//				print("delete data")
//				
//
//				
//			}
	
		func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
			
			let edit = UITableViewRowAction(style: .default, title: "Edit", handler: {(edit: UITableViewRowAction, indexPath: IndexPath) in				
			
			
			})
			edit.backgroundColor = .lightGray
			
			let delete = UITableViewRowAction(style: .default, title: "Delete", handler: {(edit: UITableViewRowAction, indexPath :IndexPath) in
				
				self.dbHelper.deleteData(self.dbHelper.people[indexPath.row])
				
				self.dbHelper.getData()
				
				tableView.reloadData()
			
			})
			
			delete.backgroundColor = .gray
			
			return [edit,delete]
			
		}
		
  }

