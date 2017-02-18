//
//  VehicleCollectionCell.swift
//  MyntraLookLike
//
//  Created by MAC on 16/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class VehicleCollectionCell: UICollectionViewCell {
    @IBOutlet weak var VehicleImageOutlet: UIImageView!

    @IBOutlet weak var favButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    favButton.backgroundColor = UIColor.clear
        
    }

   }
