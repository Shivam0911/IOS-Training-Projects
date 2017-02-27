
import UIKit
import CoreData

class ViewController: UIViewController {
  
		//MARK: Outlets
		//===========
	
	@IBOutlet weak var tableView: UITableView!
  
  var dbHelper  = DBhelper()
	
		//MARK: View Life Cycle
		//=================
	
  override func viewDidLoad() {
		
					super.viewDidLoad()

					print(#function)
			
					title = "Users List"
				
					let userListNib = UINib(nibName: "UsersListCell", bundle: nil)
			
					tableView.register(userListNib, forCellReuseIdentifier: "UsersListCellID")
			
					tableView.delegate = self
			
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

}


		// MARK: - UITableViewDataSource,UITableViewDelegate
		//========================================

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
			
					navi.isPreviewModeOn = true
		
					navi.dbHelper.people = [dbHelper.people[row]]
		
					navi.personIndex = row
		
	}
	

	func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
			
					let edit = UITableViewRowAction(style: .default, title: "Edit", handler: {(edit: UITableViewRowAction, indexPath: IndexPath) in				
				
					let row = indexPath.row
					
					let storyBoardScene = UIStoryboard(name: "Main", bundle: Bundle.main)
					
					let navi = storyBoardScene.instantiateViewController(withIdentifier : "ShowUserDetailsVCID") as! ShowUserDetailsVC
					
					self.navigationController?.pushViewController(navi, animated: true)
					
					navi.title = " Edit User Details"
					
					navi.people = self.dbHelper.people[row]
						
					navi.isPreviewModeOn = false
						
					navi.dbHelper = self.dbHelper
						
					navi.dbHelper.people = [self.dbHelper.people[row]]
					
					navi.personIndex = row
					
						
			})
		
			edit.backgroundColor = .black
			
			let delete = UITableViewRowAction(style: .default, title: "Delete", handler: {(edit: UITableViewRowAction, indexPath :IndexPath) in
				
					self.dbHelper.deleteData(self.dbHelper.people[indexPath.row])
					
					self.dbHelper.getData()
					
					tableView.reloadData()
				
			})
			
			delete.backgroundColor = .gray
			
			return [delete,edit]
			
		}
		
  }

