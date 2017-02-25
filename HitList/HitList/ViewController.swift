
import UIKit
import CoreData

class ViewController: UIViewController {

 
  @IBOutlet weak var tableView: UITableView!
  
  var dbHelper  = DBhelper()
  
  override func viewDidLoad() {
    
    super.viewDidLoad()

    title = "The List"
    
    tableView.register(UITableViewCell.self,forCellReuseIdentifier: "Cell")
    
    
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
  
      }

 }


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
    
    print(dbHelper.people.count)
    
    return dbHelper.people.count
    
  }
  

  func tableView(_ tableView: UITableView , cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let person = dbHelper.people[indexPath.row]
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    cell.textLabel?.text = person.name
    
    return cell
 
  }
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    
    return true
    
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
   
   
    if (editingStyle == UITableViewCellEditingStyle.delete) {
      
      print("delete data")
      
      dbHelper.deleteData(dbHelper.people[indexPath.row])
      
      tableView.reloadData()
      
    }
  }
}
