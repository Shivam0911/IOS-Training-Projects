//
//  ViewController.swift
//  Delegation
//
//  Created by Gurdeep on 03/02/17.
//  Copyright © 2017 Gurdeep. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var carsTableView: UITableView!
    
    let cars : [[String:Any]] =
        [
            ["carName" : "BMW", "carColor" : UIColor.white],
            ["carName" : "Audi", "carColor" : UIColor.blue],
            ["carName" : "Ford", "carColor" : UIColor.black],
            ["carName" : "Porsche", "carColor" : UIColor.red],
            ["carName" : "Tata", "carColor" : UIColor.yellow]
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      self.carsTableView.dataSource = self
      self.carsTableView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(#function)
        print(section)
        print(cars.count)
        return cars.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print(#function)
        print("indexPath.section : \(indexPath.section)")
        print("indexPath.row : \(indexPath.row)")
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CarCellID", for: indexPath) as? CarCell else {
            
            fatalError("CELL NOT FOUND")
        }
        
        cell.carNameLabel.text = cars[indexPath.row]["carName"] as? String ?? ""
        cell.carImageView.backgroundColor = cars[indexPath.row]["carColor"] as? UIColor ?? UIColor.gray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Row Selected : \(indexPath.row)")
        guard let cell = tableView.cellForRow(at: indexPath) as? CarCell else { return }
        cell.carImageView.backgroundColor = UIColor.brown
    }
    
}


class CarCell: UITableViewCell {
    
    @IBOutlet weak var carImageView: UIImageView!
    
    @IBOutlet weak var carNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Equivalent to "viewDidLoad" for UIVIewController
        // Manipulate UI accordingly
        
        carImageView.layer.cornerRadius = carImageView.layer.bounds.size.width/2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        carImageView.image = nil
        carImageView.backgroundColor = UIColor.white
        carNameLabel.text = ""
    }
    
}

