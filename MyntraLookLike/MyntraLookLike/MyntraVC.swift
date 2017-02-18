
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
   typealias tuple = (row : Int , col : Int)
    var selectedFavorite = [Int : [tuple : Bool]]? = nil
    var vehicleCell = VehicleCell()
    let jsonData = JsonData()
  //  var favorite = [[IndexPath]]()
    let superview = GetSuperView()
    var IndexpathArray = [IndexPath]()
    //MARK: View Life Cycle
    //=====================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        vehicleTable.dataSource = self
        vehicleTable.delegate = self
        let vehicleCellNib = UINib(nibName: "VehicleCell", bundle: nil)
        vehicleTable.register(vehicleCellNib, forCellReuseIdentifier: "vehicleCellID")
        let TableHeader = UINib(nibName: "TableSectionHeader", bundle: nil)
        vehicleTable.register(TableHeader, forHeaderFooterViewReuseIdentifier: "TableSectionHeaderID")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

    //MARK: TableViewDelegates, TableViewDataSource
    //=========================
extension MyntraVC :  UITableViewDelegate,UITableViewDataSource{
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "vehicleCellID", for: indexPath) as? VehicleCell else{
            fatalError("Cell Not Found !")
        }
        
    //MARK: Registered VehicleCollectionCell for table cell
    //=========================
        let vehicleCellNib = UINib(nibName: "VehicleCollectionCell", bundle: nil)
        cell.vehicleGalleryCollection.register(vehicleCellNib, forCellWithReuseIdentifier: "VehicleCollectionCellID")
        cell.vehicleGalleryCollection.delegate = self
        cell.vehicleGalleryCollection.dataSource = self
        cell.hideShowSegmentedButton.addTarget(self, action: #selector(self.hideShowSegmentedButtonAction(_:) ), for: .valueChanged)
        return cell
    }
     func numberOfSections(in tableView: UITableView) -> Int{
    return 3
    }
    //MARK: TableSectionHeader datasource viewForHeaderInSection
    //=========================
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerSection = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableSectionHeaderID") as? TableSectionHeader else{
            fatalError("Cell Not Found !")
        }
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
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        if(IndexpathArray.contains(indexPath)){
            return 40
        }
        else{          
          return 120
        }
    }
}

    //MARK: UICollectionView Delegates,DataSources
    //=========================
extension MyntraVC :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 10
    }
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VehicleCollectionCellID", for: indexPath) as? VehicleCollectionCell else{
            fatalError("Cell Not Found !")
        }
        
        // print("\(#function)===\(collectionView.indexPath(for:cell))")
        cell.favButton.addTarget(self, action: #selector(self.favButtonAction(_:)), for: .touchUpInside)
        return cell
    }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width : 80, height : 80)
    }
    
    //MARK: didSelectItemAt this is called every time a cell is selected
    //========================
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! VehicleCollectionCell
        
        //MARK: NAvigation Insatantiation
         //========================
        let storyBoardScene = UIStoryboard(name: "Main", bundle: Bundle.main)
        let navi = storyBoardScene.instantiateViewController(withIdentifier : "PreviewVCID") as! PreviewVC
        navi.image = cell.VehicleImageOutlet.image!
        UIView.animate(withDuration: 0.5,delay : 0.0,options : .curveEaseIn , animations: {
            self.navigationController?.pushViewController(navi, animated: true)
            })
           }
}
extension MyntraVC {
    //MARK: FavoriteButton Action Method
    //=========================
    func favButtonAction(_ sender: UIButton) {
        
    //MARK: Get CollectionCell From Button
    //=========================
        let collectionCell = superview.getDesiredSuperView(sender, desiredSuperView : "CollectionCell",fromSubView: "button") as! VehicleCollectionCell
        
    //MARK: Get TableViewCell From CollectionCelltton
    //=========================
        let tableViewCell = superview.getDesiredSuperView(collectionCell,desiredSuperView : "TableCell" , fromSubView: "CollectionCell") as! VehicleCell
        let tableIndexPath = vehicleTable.indexPath(for : (tableViewCell))
        let collectionIndexPath = tableViewCell.vehicleGalleryCollection.indexPath(for : (collectionCell))
        print("tableIndexPath =\(tableIndexPath!)")
        print("tableIndexPath row =\(tableIndexPath!.item)")
        print("tableIndexPath section =\(tableIndexPath!.section)")
        print("collectionIndexPath = \(collectionIndexPath!)")
        print("collectionIndexPath col = \(collectionIndexPath!.item)")
        if sender.isSelected{
            sender.isSelected = false
            self.favorite.remove(at: favorite.index(where: {  $0 == [tableIndexPath!,collectionIndexPath!] })!)
        }
        else{
            sender.isSelected = true
            self.favorite.append([tableIndexPath!,collectionIndexPath!])
        }
       
    }
    //MARK: SegmentedButtonAction for hideShowSegmentedButton
    //=========================
    func hideShowSegmentedButtonAction(_ sender : UISegmentedControl){
        let tableViewCell = sender.superview?.superview as! VehicleCell
        let tableIndexPath = vehicleTable.indexPath(for : (tableViewCell))
        if sender.selectedSegmentIndex == 1 {
            self.IndexpathArray.append(tableIndexPath!)
            self.vehicleTable.reloadRows(at: [tableIndexPath!], with: .fade)
        }
        else {
           self.IndexpathArray.remove(at: IndexpathArray.index(where: {  $0 == tableIndexPath! })!)
            self.vehicleTable.reloadRows(at: [tableIndexPath!], with: .fade)
        }
        
    }
}

 
