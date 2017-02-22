//
//  VehicleCollectionCell.swift
//  MyntraLookLike
//
//  Created by MAC on 16/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class VehicleCollectionCell: UICollectionViewCell {
   //MARK: Outlets of VehicleCollectionCell
    //============================
    
    @IBOutlet weak var VehicleImageOutlet: UIImageView!
    
    @IBOutlet weak var favButton: UIButton!
    
    var sectionTag : Int = 0
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        favButton.backgroundColor = UIColor.clear
        
        self.VehicleImageOutlet.contentMode = .scaleAspectFill

   }
    
    override func prepareForReuse() {
        
        self.VehicleImageOutlet.contentMode = .scaleAspectFill
        
        favButton.isSelected = false
    
    }
    
    
}
