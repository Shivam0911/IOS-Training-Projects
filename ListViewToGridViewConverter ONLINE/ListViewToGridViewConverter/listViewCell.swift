//
//  listViewCell.swift
//  ListViewToGridViewConverter
//
//  Created by MAC on 13/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class listViewCell: UICollectionViewCell {
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
      //  carImage.layer.cornerRadius = carImage.layer.bounds.height/2

        // Initialization code
    }
    func populateTheData(_ data : [String:String]){
        print(#function)
        let imageUrl = data["CarImage"]!
        self.carImage.backgroundColor = UIColor(patternImage: UIImage(named: imageUrl)!)
        // carImage.backgroundColor = UIColor.cyan
        carName.text = data["CarName"]!
        
    }
    override func prepareForReuse() {
        
        
    }

}
