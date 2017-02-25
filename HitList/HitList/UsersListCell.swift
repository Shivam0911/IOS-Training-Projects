//
//  UsersListCell.swift
//  HitList
//
//  Created by MAC on 25/02/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import UIKit

class UsersListCell: UITableViewCell {

	@IBOutlet weak var userNameLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
