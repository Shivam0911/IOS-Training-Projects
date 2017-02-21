//
//  PreviewVC.swift
//  WebServiceHitDemo
//
//  Created by MAC on 21/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class PreviewVC: UIViewController {

    var imageUrl : URL?  // High pixel   picture URL
    @IBOutlet weak var previewImage: UIImageView!
    
        override func viewDidLoad() {
          
            self.viewSubView()
            
    }
        private func  viewSubView() {
            previewImage.af_setImage(withURL : imageUrl!)  //Sets the Image of the Background according to the selected cell

                }
    


}
