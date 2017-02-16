//
//  MyntraVCViewController.swift
//  MyntraLookLike
//
//  Created by MAC on 16/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class MyntraVC: UIViewController {

    @IBOutlet weak var vehicleTable: UITableView!
    var vehicleCell = VehicleCell()
    
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

extension MyntraVC :  UITableViewDelegate,UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "vehicleCellID", for: indexPath) as? VehicleCell else{
            fatalError("Cell Not Found !")
        }
        let vehicleCellNib = UINib(nibName: "VehicleCollectionCell", bundle: nil)
        cell.vehicleGalleryCollection.register(vehicleCellNib, forCellWithReuseIdentifier: "VehicleCollectionCellID")
        cell.vehicleGalleryCollection.delegate = self
        cell.vehicleGalleryCollection.dataSource = self
        return cell
    }
    public func numberOfSections(in tableView: UITableView) -> Int{
    return 4
    }
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerSection = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableSectionHeaderID") as? TableSectionHeader else{
            fatalError("Cell Not Found !")
        }
        switch section {
        case 0 : headerSection.headerLabel.text = "Cars"
        case 1:  headerSection.headerLabel.text = "Bikes"
        case 2:
                headerSection.headerLabel.text = "Trucks"
        case 3:
                headerSection.headerLabel.text = "BMW"
        case 4:
                headerSection.headerLabel.text = "Jaguar"
        default:
                headerSection.headerLabel.text = "default"
        }
        return headerSection
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
     return 120
    }
}
extension MyntraVC :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 10
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VehicleCollectionCellID", for: indexPath) as? VehicleCollectionCell else{
            fatalError("Cell Not Found !")
        }
        return cell
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width : 80, height : 80)
    }
}

 
