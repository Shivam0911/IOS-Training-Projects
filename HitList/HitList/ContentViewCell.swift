//
//  ContentViewCell.swift
//  HitList
//
//  Created by MAC on 24/02/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import UIKit

class ContentViewCell: UITableViewCell {
  
  @IBOutlet weak var inputTypeLabel: UILabel!
  
  @IBOutlet weak var inputTextField: UITextField!

  
    override func awakeFromNib() {
      
        super.awakeFromNib()
      
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
