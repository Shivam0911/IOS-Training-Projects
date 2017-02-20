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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
                print(#function)
    }
    override func prepareForReuse() {
        hideShowButton.isSelected = false
    }
   }
