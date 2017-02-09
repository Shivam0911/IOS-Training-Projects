//
//  signUpVC.swift
//  SirUI
//
//  Created by MAC on 06/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class signUpVC: UIViewController , UITableViewDataSource, UITableViewDelegate{
//    cell.carNameLabel.text = cars[indexPath.row]["carName"] as? String ?? ""

    let details : [[String:Any]] =
        [
            ["label1" : "FullName", "label2" : "Shivam Gaur"],
            ["label1" : "Email", "label2" : "shivam@appinventiv.com"],
            ["label1" : "Password", "label2" : "**************"],
            ["label1" : "BirthDay", "label2" : "9-Nov-1995"],
            ["label1" : "Gender", "label2" : "Male"],
            ["label1" : "Height", "label2" : "5'7''"],
            ["label1" : "Weight", "label2" : "62"]
    ]
    
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var saveChangesButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile Settings"
        self.mainTableView.dataSource = self
        self.mainTableView.delegate = self
        self.mainTableView.backgroundColor = UIColor.clear //sets backgroundColor to Clear

          }
    
    /*
     This func clearBackGround( _ cell1 : UITableViewCell) is used to clear the backgroundColor of contentView,
     CellView,
     
     */
    func clearBackGround( _ cell1 : UITableViewCell) {
    
                cell1.contentView.backgroundColor = UIColor.clear
                cell1.backgroundColor = UIColor.clear
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
           }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return details.count + 1 //return no of rows
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function,indexPath)
        
            return returnCell(tableView,indexPath)
        
    }
    /*
        func returnCell(_ tableView: UITableView,_ indexPath: IndexPath) ->UITableViewCell is used to return respective cell according to the Row Number Specified
     
     */
    func returnCell(_ tableView: UITableView,_ indexPath: IndexPath) ->UITableViewCell{
        if indexPath.row == 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCellID", for: indexPath) as! ImageCell
            clearBackGround(cell)
            return cell
        }
        else if  indexPath.row < details.count{
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "DetailsID", for: indexPath) as! Details
            cell2.labelOne.text = details[indexPath.row-1]["label1"] as? String ?? ""
            cell2.labelTwo.text = details[indexPath.row-1]["label2"] as? String ?? ""
                 return cell2
        }
        else{
        
        let cell3 = tableView.dequeueReusableCell(withIdentifier: "SaveButtonID", for: indexPath) as! SaveButtonCell
           print("cell3")
            return cell3
        }
        
    
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            
            return 150
        }
        else {
            
            return 60
        }
    }
}

//class imageCell is linked with the image inside the cell  and the AddButton
class ImageCell: UITableViewCell {
 @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var AddButton: UIButton!
    override func awakeFromNib() {  // In this method implementaion to convert sqaure image into round image is done
        super.awakeFromNib()
        self.imageView1.clipsToBounds = true
         self.AddButton.layer.cornerRadius = self.AddButton.layer.bounds.width/2
        self.imageView1.layer.cornerRadius = self.imageView1.layer.bounds.width/2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }


}

// class Details is linked to the two labels and the DetailCell
class Details: UITableViewCell {
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
             }
    
    //Use func prepareForReuse() to set the values of cell to be reused to Null or prepare them befrore reusing them
   override func prepareForReuse() {
       super.prepareForReuse()
       self.labelOne.text = ""
       self.labelTwo.text = ""
    
    }
    

}
class SaveButtonCell : UITableViewCell{

    @IBOutlet weak var addBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addBtn.layer.cornerRadius = self.addBtn.layer.bounds.height/2 // sets the cornerRadius of SaveButton
    }


}

