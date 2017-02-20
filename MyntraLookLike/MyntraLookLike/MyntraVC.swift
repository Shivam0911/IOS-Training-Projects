
//
//  MyntraVCViewController.swift
//  MyntraLookLike
//
//  Created by MAC on 16/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class MyntraVC: UIViewController {
    
    //MARK:Outlets
    //=====================
    @IBOutlet weak var vehicleTable: UITableView!
  
    //MARK:Objects
    //=====================
     var vehicleCell = VehicleCell()
    
    //MARK:Variables
    //=====================
     var vehicleCellIndexpathArray = [IndexPath]()
     var favorites = [[IndexPath]]()
     var sectionIndexPathsArray = [IndexPath]()
    var expandedSections = [Int]()
    
    //MARK: View Life Cycle
    //=====================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        vehicleTable.dataSource = self
        vehicleTable.delegate = self
        
    //MARK: Register VehicleCell NIB
    //=====================
        let vehicleCellNib = UINib(nibName: "VehicleCell", bundle: nil)
        vehicleTable.register(vehicleCellNib, forCellReuseIdentifier: "vehicleCellID")
       
    //MARK: Register TableSectionHeader NIB
    //=====================
        let TableHeader = UINib(nibName: "TableSectionHeader", bundle: nil)
        vehicleTable.register(TableHeader, forHeaderFooterViewReuseIdentifier: "TableSectionHeaderID")
    }
   
    override func didReceiveMemoryWarning() {
       
        super.didReceiveMemoryWarning()
    }
    
}

    //MARK: TableViewDelegates, TableViewDataSource
    //=========================
extension MyntraVC :  UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int    {
        if expandedSections.contains(section)
        {
        return 0
        }
        else{
        return 5
        }
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "vehicleCellID", for: indexPath) as? VehicleCell else    {
            fatalError("Cell Not Found !")
            
        }
        
        if(vehicleCellIndexpathArray.contains(indexPath))  {
            
            cell.hideShowButton.isSelected = true
        }
        
    //MARK: Registered VehicleCollectionCell for table cell
    //=========================
        let vehicleCellNib = UINib(nibName: "VehicleCollectionCell", bundle: nil)
        cell.vehicleGalleryCollection.register(vehicleCellNib, forCellWithReuseIdentifier: "VehicleCollectionCellID")
        cell.vehicleGalleryCollection.delegate = self
        cell.vehicleGalleryCollection.dataSource = self
        cell.hideShowButton.addTarget(self, action: #selector(self.hideShowButtonTapped(_:) ), for: .touchUpInside)
        return cell
    }
    
     func numberOfSections(in tableView: UITableView) -> Int{
    return 3
    }
    
    //MARK: TableSectionHeader datasource viewForHeaderInSection
    //=========================
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     
        guard let headerSection = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableSectionHeaderID") as? TableSectionHeader else {
            
            fatalError("Cell Not Found !")
            
        }
        //Registered autoHideSectionButton for header
       
        if (expandedSections.contains(section)) {
            headerSection.autoHideSectionButton.isSelected = true
           
        } else {
            headerSection.autoHideSectionButton.isSelected = false
         
        }
        headerSection.autoHideSectionButton.tag = section
        headerSection.autoHideSectionButton.addTarget(self, action: #selector(sectionTapped), for: .touchUpInside)
        
        
        //Changes the title of the headerSection
        switch section {
        case 0 :  headerSection.headerLabel.text = "Cars"
            
        case 1 :  headerSection.headerLabel.text = "Bikes"
            
        case 2 :  headerSection.headerLabel.text = "Trucks"
            
        case 3 :  headerSection.headerLabel.text = "BMW"
            
        case 4 :  headerSection.headerLabel.text = "Jaguar"
            
        default:  headerSection.headerLabel.text = "default"
        }
        
        return headerSection
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat  {
        
        return 50
   
    }
       public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
       
        if(vehicleCellIndexpathArray.contains(indexPath))  {          //decreases the height of the table cell
           
            return 40
            
        }else   {
            
            return 120
            
        }
    }
    
    func sectionTapped(sender: UIButton) {
        print("section Tapped")
        let section = sender.tag
       
        if sender.isSelected {
            
            expandedSections =  self.expandedSections.filter()
                {
                    (index) -> Bool in
                    
                    return    index != section
            }
            
        }
        else {
           
              expandedSections.append(section)
        }
         sender.isSelected = !sender.isSelected
        self.vehicleTable.reloadSections([section],with :  .fade)
    }
    
   
}

    //MARK: UICollectionView Delegates,DataSources
    //=========================
extension MyntraVC :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    
    //Returns no of items in each section
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int    {
       
        return 10
    }
    //visits each row and returns respective cells
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
       
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VehicleCollectionCellID", for: indexPath) as? VehicleCollectionCell else  {
            fatalError("Cell Not Found !")
        }
    //regisers favButton with an action Method
        cell.favButton.addTarget(self, action: #selector(self.favButtonAction(_:)), for: .touchUpInside)
        
        return cell
    }
    //returns CGSize for each item at Indexpath
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width : 80, height : 80)
        
    }
    
    //MARK: didSelectItemAt this is called every time a cell is selected
    //========================
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)   {
      
        let cell = collectionView.cellForItem(at: indexPath) as! VehicleCollectionCell
        
    //MARK: Navigation Insatantiation
    //========================
        let storyBoardScene = UIStoryboard(name: "Main", bundle: Bundle.main)
        let navi = storyBoardScene.instantiateViewController(withIdentifier : "PreviewVCID") as! PreviewVC
        navi.image = cell.VehicleImageOutlet.image!
        self.navigationController?.pushViewController(navi, animated: true)
  
    }

}
extension MyntraVC {
    //MARK: FavoriteButton Action Method
    //=========================
    func favButtonAction(_ sender: UIButton) {
        
    //MARK: Get CollectionCell From Button
    //=========================
        guard   let collectionCell = sender.getCollectionViewCell() as? VehicleCollectionCell else {fatalError("no collectionViewCell Found")}
        
    //MARK: Get TableViewCell From CollectionCell
    //=========================
       
        guard  let vehicleTableViewCell = collectionCell.getTableViewCell() as? VehicleCell else {fatalError("no vehicleTableViewCell Found")}
        let vehicleTableIndexPath = vehicleTable.indexPath(for : (vehicleTableViewCell))
        let vehicleCollectionIndexPath = vehicleTableViewCell.vehicleGalleryCollection.indexPath(for : (collectionCell))
        
//        print("tableIndexPath =\(tableIndexPath!)")
//        print("tableIndexPath row =\(tableIndexPath!.item)")
//        print("tableIndexPath section =\(tableIndexPath!.section)")
//        print("collectionIndexPath = \(collectionIndexPath!)")
//        print("collectionIndexPath col = \(collectionIndexPath!.item)")
        
        if sender.isSelected{
            sender.isSelected = false
            self.favorites.remove(at: favorites.index(where: {  $0 == [vehicleTableIndexPath!,vehicleCollectionIndexPath!] })!)
        }
        else{
            sender.isSelected = true
            self.favorites.append([vehicleTableIndexPath!,vehicleCollectionIndexPath!])
        }
       
    }
    //MARK: ButtonAction for hideShowButton
    //=========================
    func hideShowButtonTapped(_ sender : UIButton)   {
       
        guard  let tableViewCell = sender.getTableViewCell() as? VehicleCell else {fatalError("no tableViewCell Found")}
        let tableIndexPath = vehicleTable.indexPath(for : (tableViewCell))
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
           
            self.vehicleCellIndexpathArray.append(tableIndexPath!)
            //reloads the rows at specific table indexPaths
            self.vehicleTable.reloadRows(at: [tableIndexPath!], with: .fade)
            
        }
        else {
            vehicleCellIndexpathArray =  self.vehicleCellIndexpathArray.filter()    {
            (indices) in
            return    indices != tableIndexPath!
            }
            //reloads the rows at specific table indexPaths
            self.vehicleTable.reloadRows(at: [tableIndexPath!], with: .fade)
            
        }
    }
    
    
}


 
