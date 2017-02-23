//
//  LeftSliderVC.swift
//  SliderDemo
//
//  Created by MAC on 23/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class LeftSliderVC: UIViewController {

    @IBOutlet weak var colorListTable: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.doSubViewLoad()
        
    }
    
    //MARK: doSubViewLoad Method
    //=======================
    
    private func doSubViewLoad(){
    
        colorListTable.dataSource = self
        
        colorListTable.delegate = self
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        
    }

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()
      
    }
    
}

//MARK: TableView Delegates and DataSources
//=================================
extension LeftSliderVC : UITableViewDelegate,UITableViewDataSource  {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
    
    return 6
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell   {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCellID", for: indexPath) as? ColorValuesCell
            else {
            fatalError("Cell not found")

        }
       
        cell.colorLabel.text = "Any Color !"
       
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
    
    return 60.0
    }
    //MARK: // didSelectRowAt METHOD
    //=========================
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        guard   let parentVC =  (self.parent)!    as? MainVC else    { return }
        
        let storyBoardScene = UIStoryboard(name: "Main", bundle: Bundle.main)        

        switch (indexPath.row % 3){
       
        case 0 : parentVC.changeSubView(storyBoardScene.instantiateViewController(withIdentifier : "BlueVCID") as! BlueVC)
            
        case 1 : parentVC.changeSubView(storyBoardScene.instantiateViewController(withIdentifier : "GreenVCID") as! GreenVC)
            
        case 2 : parentVC.changeSubView(storyBoardScene.instantiateViewController(withIdentifier : "MaroonVCID") as! MaroonVC)
            
        default : parentVC.changeSubView(storyBoardScene.instantiateViewController(withIdentifier : "MaroonVC") as! MaroonVC)
        
        }
        
    }
}
class ColorValuesCell : UITableViewCell {

    @IBOutlet weak var colorLabel: UILabel!

}


