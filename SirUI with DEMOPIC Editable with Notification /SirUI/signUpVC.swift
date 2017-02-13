//
//  signUpVC.swift
//  SirUI
//
//  Created by MAC on 06/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class signUpVC: UIViewController,UITextFieldDelegate {
//     cell.carNameLabel.text = cars[indexPath.row]["carName"] as? String ?? ""
    
    let details : [[String:String]] =
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
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        //Notification
        super.viewDidLoad()
        self.title = "Profile Settings" //sets the title of the navBar
        self.mainTableView.dataSource = self
        self.mainTableView.delegate = self
        self.mainTableView.backgroundColor = UIColor.clear //sets backgroundColor to Clear
        let cellnib = UINib(nibName: "detailCell", bundle: nil)
        mainTableView.register(cellnib, forCellReuseIdentifier: "DetailsID")
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.shortenView(notification:)),
            name: .UIKeyboardDidShow,
            object: nil)
    
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.extendView(notification:)),
            name: .UIKeyboardWillHide,
            object: nil)
    }
}



extension signUpVC  {
    func shortenView(notification : Notification){
        guard let user = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue else { return}
        let keyboardHeight = user.cgRectValue.height
        self.bottomConstraint.constant = keyboardHeight
    }
    func extendView(notification : Notification){
        self.bottomConstraint.constant = 0
    }
    func getIndexPath(textfield : UITextField) ->IndexPath?{
        var cell : Any = UIView()
        var texfield : Any = textfield
        
        while !(cell as? UITableViewCell){
            
            texfield = (texfield as AnyObject).superview!!
            cell = texfield
            
        }
        print(#function)
        guard let tableView : Any = (cell as AnyObject).superview as? UITableView
            else {return nil}
        
        guard let index : Any = (tableView as AnyObject).indexPath
            else {return nil}
        
        return index as? IndexPath
    }
    
}
extension signUpVC {
    public func textFieldShouldEndEditing(_ textField: UITextField){
    
    }


}
extension signUpVC : UITableViewDataSource, UITableViewDelegate{
            /*
    This func clearBackGround( _ cell1 : UITableViewCell) is used to clear the backgroundColor of contentView,
    CellView*/
    //MARK : clearBackGround
    func clearBackGround( _ cell1 : UITableViewCell) {
                 cell1.contentView.backgroundColor = UIColor.clear
                 cell1.backgroundColor = UIColor.clear
    }
    override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return details.count + 15//return no of rows
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                print(#function,indexPath)
                return returnCell(tableView,indexPath)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
                if indexPath.row == 0 {
                        return 150
                    }
                    else {
                        return 70
                    }
    }
}

extension signUpVC {
    /*
     func returnCell(_ tableView: UITableView,_ indexPath: IndexPath) ->UITableViewCell is used to return respective cell according to the Row Number Specified
     
     */
    
    func returnCell(_ tableView: UITableView,_ indexPath: IndexPath) -> UITableViewCell {
    
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCellID", for: indexPath) as! ImageCell
            //MARK : clearBackGround(cell)
            return cell
        }
        else if indexPath.row < details.count - 1{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "DetailsID", for: indexPath) as! detailCell
            cell2.processData(details[indexPath.row - 1])
            return cell2
        }
                   else {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "DetailsID", for: indexPath) as! detailCell
            cell2.processData(details[1])
            return cell2
//            let cell3 = tableView.dequeueReusableCell(withIdentifier: "SaveButtonID", for: indexPath) as! SaveButtonCell
//            print("cell3")
//            return cell3
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
        self.imageView1.layer.borderWidth = 2
        self.imageView1.layer.borderColor = UIColor.white.cgColor
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
class SaveButtonCell : UITableViewCell{
    @IBOutlet weak var addBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addBtn.layer.cornerRadius = self.addBtn.layer.bounds.height/2 // sets the cornerRadius of SaveButton
    }
}

