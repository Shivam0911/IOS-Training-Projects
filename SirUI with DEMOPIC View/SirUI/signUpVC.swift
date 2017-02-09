//
//  signUpVC.swift
//  SirUI
//
//  Created by MAC on 06/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class signUpVC: UIViewController , UITableViewDataSource, UITableViewDelegate{

   
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var saveChangesButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile Settings"
        self.mainTableView.dataSource = self
        self.mainTableView.delegate = self
        self.view1.backgroundColor = UIColor.clear
        self.mainTableView.backgroundColor = UIColor.clear
        self.saveChangesButton.layer.cornerRadius = saveChangesButton.layer.bounds.size.width/8
        self.view1.clipsToBounds = true
        self.imageView.clipsToBounds = true
        self.imageView.layer.cornerRadius = self.imageView.layer.bounds.width/2

        // Do any additional setup after loading the view.
        
        func viewWillLayoutSubviews(){
            
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function,indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsID", for: indexPath) as? signUp
       // cell?.contentView.backgroundColor = UIColor.clear
       // cell?.backgroundColor = UIColor.clear
        mainTableView.separatorColor =  UIColor.black
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    
    
}
class signUp: UITableViewCell {
    
   
  
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//       
//         }
//    
//   override func prepareForReuse() {
//       super.prepareForReuse()
//       imageView.image = nil
//       imageView.backgroundColor = UIColor.white
//       BatManLabel.text = ""
//   }
//    

}

