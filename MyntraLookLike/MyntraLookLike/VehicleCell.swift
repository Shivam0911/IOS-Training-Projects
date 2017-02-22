//
//  VehicleCell.swift
//  MyntraLookLike
//
//  Created by MAC on 16/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class VehicleCell: UITableViewCell { 
 
   
    @IBOutlet weak var hideShowButton: UIButton!
    
    @IBOutlet weak var vehicleBrandLabel: UILabel!
    
    @IBOutlet weak var vehicleGalleryCollection: UICollectionView!
    
    var vehicleIndex = IndexPath()
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        }
    override func prepareForReuse() {
        
        hideShowButton.isSelected = false
        
        vehicleBrandLabel.text = ""
   
        }
}

extension VehicleCell {
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, _ indexPath : IndexPath) {
    
            vehicleGalleryCollection.delegate = dataSourceDelegate
        
            vehicleGalleryCollection.dataSource = dataSourceDelegate
                
            vehicleGalleryCollection.reloadData()
        }        
}
