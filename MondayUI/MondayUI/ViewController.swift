//
//  ViewController.swift
//  MondayUI
//
//  Created by MAC on 06/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    @IBOutlet weak var BatManTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.BatManTableView.dataSource = self
        self.BatManTableView.delegate = self
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function,indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "BatManCellID", for: indexPath) as? BatMan
       // cell?.BatManLabel.text = "Shivam"
     //   cell?.layer.cornerRadius = (cell?.layer.bounds.size.width)!/7
        cell?.contentView.backgroundColor = UIColor.clear
        cell?.backgroundColor = UIColor.clear
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.gray
        cell?.selectedBackgroundView = bgColorView
        BatManTableView.backgroundColor = UIColor.clear
        BatManTableView.separatorColor =  UIColor.clear
        return cell!

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard (tableView.cellForRow(at: indexPath) as? BatMan) != nil else { return }
       // cell.BatManImage.backgroundColor = UIColor.green
    }
//    func numberOfSections(in tableView: UITableView) -> Int {
//        print(#function)
//        return 2
//    }
//    
}
class BatMan: UITableViewCell {
    
    @IBOutlet weak var BatManImage: UIImageView!
    
    @IBOutlet weak var BatManLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("yoho")
        BatManImage.layer.cornerRadius = BatManImage.layer.bounds.size.width/2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        BatManImage.image = nil
        BatManImage.backgroundColor = UIColor.white
        BatManLabel.text = ""
    }
    
}




