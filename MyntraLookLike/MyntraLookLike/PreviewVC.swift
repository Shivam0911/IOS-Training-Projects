//
//  PreviewVC.swift
//  MyntraLookLike
//
//  Created by MAC on 18/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit
class PreviewVC : UIViewController{
    var image : UIImage?
    
    @IBOutlet weak var previewImage: UIImageView!
    
    override func viewDidLoad() {
        
        viewSubView()
        
    }
    private func  viewSubView(){
        
        self.title = "Preview"
        
        self.previewImage.image = self.image      //Sets the Image of the Background according to the selected cell
    }

}
