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
        self.previewImage.image = self.image
       // self.previewImage.backgroundColor = UIColor(patternImage: image!)
     //   let pinchImage = UIPinchGestureRecognizer(target: self, action: #selector(self.selectOnPinch))
        //pinchImage.delegate = self
        //previewImage.addGestureRecognizer(pinchImage)
        

    }

}
//extension PreviewVC : UIGestureRecognizerDelegate{
//    func selectOnPinch(_ gesture : UIPinchGestureRecognizer){
//        switch gesture.state{
//        case .began : print("began")
//            
//        
//        }
//    
//    }

