//
//  detailCell.swift
//  SirUI
//
//  Created by MAC on 08/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

// class detailCell is linked to the two labels and the DetailCell

class detailCell: UITableViewCell {
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var inputText: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        //Use func prepareForReuse() to set the values of cell to be reused to Null or prepare them befrore reusing them
        super.prepareForReuse()
//        self.labelOne.text = ""
//        self.inputText.text = ""
    }
    
    
    func processData(_ data : [String:String]) {
        labelOne.text = data["label1"]!
        inputText.text = data["label2"]!        
    }
}
