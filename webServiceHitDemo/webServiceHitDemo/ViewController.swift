//
//  ViewController.swift
//  WebServiceHitDemo
//
//  Created by MAC on 20/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage

class ViewController: UIViewController {
    var carsPicturesData = [JSON]()
     var previewURL: String = ""
    //var carModel : CarModel?
    let tempData  =  CarModel()
    
    @IBOutlet weak var carsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        carsTable.delegate = self
        carsTable.dataSource = self
         self.fetchData(withQuery: "Cars")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchData(withQuery query: String) {
        
        let URL = "https://pixabay.com/api/"
        
        let parameters = ["key" : "4608367-6e44818b4d4b3d9094faa3be8",
                          
                          "q" : query
        ]
        
        Alamofire.request(URL,
                          method: .get,
                          parameters: parameters,
                          encoding: URLEncoding.default,
                          headers: nil).responseJSON { (response :DataResponse<Any>) in
                            
                            if let value = response.result.value as? [String:Any] {
                                
                                let json = JSON(value)
                                //print(json)
                               self.carsPicturesData = json["hits"].array!
                                print("--------------------------------------------")
                               // print(self.carsPicturesData)
                                
                                self.tempData.setValues([self.carsPicturesData])
                                
                            } else if let error = response.result.error {
                             
                                print(error)
                            }
                            
        }
        
    }
    



}
extension ViewController   : UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    
    return 10
    
    }
    
   
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CarsTableID", for: indexPath) as? CarsTableCell  else{fatalError("nil") }
        let ur = NSURL(fileURLWithPath: self.tempData.getValue() ) as URL
        cell.carsImageView.af_setImage(withURL: ur)

        return cell
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
    
    return 250.0
    }


}
class CarsTableCell : UITableViewCell{

    @IBOutlet weak var carsImageView: UIImageView!
    
   
}

