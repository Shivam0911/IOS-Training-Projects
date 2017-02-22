
//
//  MyntraVCViewController.swift
//  MyntraLookLike
//
//  Created by MAC on 16/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit
import AlamofireImage

class MyntraVC: UIViewController {
    
    //MARK: Outlets
    //=====================
   
    @IBOutlet weak var vehicleTable: UITableView!
   
    //MARK: Objects
    //=====================
    
    var vehicleCell = VehicleCell()
    
    //MARK: Variables
    //=====================
   
    var vehicleCategory = ["Cars","Bikes","Trucks"]
    
    var vehicleCellIndexpathArray = [IndexPath]()
    
    var expandedSections = [Int]()
    
    var imagesList = [VehicleModel]()
    
    var storedList  = [[[VehicleModel]]]()
    
    var searchQuery : String? = "BMW"
    
    var sectionHeaders = ["Cars" , "Bikes" , "Trucks"]
    var titles : [[String]] = [["Audi","BMW","Jaguar","Ferrari"],["Bajaj Bikes","Indian Bikes","Yamaha Bikes","Suzuki Bikes"],["Mahindra Truck","Tata Truck","Ashoka Leyland","Eicher Trucks"]]
    
   
    //MARK: View Life Cycle
    //=====================
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        doSubViewLoad()
    
    }
    
    //MARK: doSubViewLoad
    //=====================
    private func doSubViewLoad()
    {
        vehicleTable.dataSource = self
        
        vehicleTable.delegate = self
        
    // Register VehicleCell NIB
          let vehicleCellNib = UINib(nibName: "VehicleCell", bundle: nil)
        
        vehicleTable.register(vehicleCellNib, forCellReuseIdentifier: "vehicleCellID")
        
    // Register TableSectionHeader NIB
            let TableHeader = UINib(nibName: "TableSectionHeader", bundle: nil)
        
        vehicleTable.register(TableHeader, forHeaderFooterViewReuseIdentifier: "TableSectionHeaderID")
        
        self.webHitSevice()
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    //MARK: webHitService Method
    //======================
    func    webHitSevice()  {
        
        for section in 0...2    {
                                            storedList.append([])
            
                                            for row in 0...3  {
                
                                                storedList[section].append([])
                                                                    WebServices().fetchDataFromPixabay(withQuery: titles[section][row], success: {
                    
                                                                    (rawData : [VehicleModel]) in
                    
                                                                    self.storedList[section][row] = rawData
                    
                                                                    self.vehicleTable.reloadData()
                    
                                                                    })  { (error : Error) in  print(error)}
            }
        }
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
        else    {
            
            return storedList[section].count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "vehicleCellID", for: indexPath) as! VehicleCell

        cell.vehicleIndex = indexPath
        
        //  searchQuery = SearchQuery().getSearchQuery(sectionHeaders[indexPath.section],indexPath.row)
        
        return cell
    }
    
    //MARK: willDisplay Method
    //=====================
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? VehicleCell else { return }
        
        if(vehicleCellIndexpathArray.contains(indexPath))  {
            
            tableViewCell.hideShowButton.isSelected = true
        }
        
    // Registered VehicleCollectionCell for table cell
        
        let vehicleCellNib = UINib(nibName: "VehicleCollectionCell", bundle: nil)
        
        tableViewCell.vehicleGalleryCollection.register(vehicleCellNib, forCellWithReuseIdentifier: "VehicleCollectionCellID")
        
        tableViewCell.hideShowButton.addTarget(self, action: #selector(self.hideShowButtonTapped(_:) ), for: .touchUpInside)
        
        tableViewCell.setCollectionViewDataSourceDelegate(self, indexPath)
        
        tableViewCell.vehicleBrandLabel.text = titles[indexPath.section][indexPath.row]
        
        }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        
        return storedList.count
        
    }
    
    // TableSectionHeader datasource viewForHeaderInSection
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let headerSection = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableSectionHeaderID") as? TableSectionHeader else {
            
            fatalError("Cell Not Found !")
            
        }
        
    // Registered autoHideSectionButton for header
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
    
    //MARK: sectionTapped Action Method
    //===========================
    func sectionTapped(sender: UIButton) {
        
        print("section Tapped")
        
        let section = sender.tag
        
        if sender.isSelected {
            
            expandedSections =  self.expandedSections.filter()  {
                
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
        
        let tableCell = collectionView.getTableViewCell() as! VehicleCell
        
        return storedList[tableCell.vehicleIndex.section][tableCell.vehicleIndex.row].count
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
    
    //MARK: Collection WillDisPlay Method
    //===========================
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath){
        
        let cell = cell as! VehicleCollectionCell
        
        guard  let vehicleTableViewCell = cell.getTableViewCell() as? VehicleCell else {return}
        
        let model : VehicleModel = storedList[vehicleTableViewCell.vehicleIndex.section][vehicleTableViewCell.vehicleIndex.row][indexPath.row]
        
                   if let url = URL(string: model.previewURL)  {
                
                            print("indexPath Row \(indexPath.row)")
                
    // gets  preview Url and sets the image of each cell
                            cell.VehicleImageOutlet.af_setImage(withURL : url)
                    
        }
        
        if(model.isFav) {
            
            cell.favButton.isSelected = true
            
        }
        
    }
    
    //returns CGSize for each item at Indexpath
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width : 80, height : 80)
        
    }
    
    //MARK: didSelectItemAt this is called every time a cell is selected
    //========================
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)   {
        
        let collectionCell = collectionView.cellForItem(at: indexPath) as! VehicleCollectionCell
        
    //MARK: Navigation Insatantiation
    //========================
        
        let storyBoardScene = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let navi = storyBoardScene.instantiateViewController(withIdentifier : "PreviewVCID") as! PreviewVC
              
        navi.image = collectionCell.VehicleImageOutlet.image!
        
        self.navigationController?.pushViewController(navi, animated: true)
        
           }
    
}



extension MyntraVC {
    
    //FavoriteButton Action Method
    func favButtonAction(_ sender: UIButton) {
        
    // Get CollectionCell From Button
        guard   let collectionCell = sender.getCollectionViewCell() as? VehicleCollectionCell else {fatalError("no collectionViewCell Found")}
        
    //Get TableViewCell From CollectionCell
        guard  let vehicleTableViewCell = collectionCell.getTableViewCell() as? VehicleCell else {fatalError("no vehicleTableViewCell Found")}
        
        let vehicleTableIndexPath = vehicleTable.indexPath(for : (vehicleTableViewCell))!
        
        let vehicleCollectionIndexPath = vehicleTableViewCell.vehicleGalleryCollection.indexPath(for : (collectionCell))!
        
            if sender.isSelected    {
            
            sender.isSelected = false
            storedList[vehicleTableIndexPath.section][vehicleTableIndexPath.row][vehicleCollectionIndexPath.row].isFav = false
       
        }
        else   {
            
            sender.isSelected = true
            
            storedList[vehicleTableIndexPath.section][vehicleTableIndexPath.row][vehicleCollectionIndexPath.row].isFav = true
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



