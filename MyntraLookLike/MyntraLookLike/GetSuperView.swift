//
//  GetSuperView.swift
//  MyntraLookLike
//
//  Created by MAC on 17/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//
import UIKit

extension UIView{
    
    //gets the UiView reference for CollectionViewCell
    func getCollectionViewCell( ) ->UIView? {

        var subView = self
        
        while !(subView is UICollectionViewCell) {
        
            guard let   cell  =  subView.superview else{ return nil }
            
            subView = cell
            
        }
        
        return subView
    }
    
    //gets the UiView reference forTableViewCell
    func getTableViewCell( ) ->UIView? {
        
        var subView = self
        
        while !(subView is UITableViewCell) {
            
            guard let   cell  =  subView.superview else{ return nil }
            
            subView = cell
      
        }
        
        return subView
        
    }

}








    //MARK: getDesiredSuperView Method used for the desired superview reference
//    func getDesiredSuperView(_ currentViewObject : Any, desiredSuperView : String,fromSubView : String ) -> Any{
//        //var type : Any
//        var cell : Any
//        switch fromSubView{
//        case "button" : cell = currentViewObject as! UIButton
//        case "TableCell" : cell = currentViewObject as! UITableViewCell
//        case "CollectionCell" : cell = currentViewObject as! UICollectionViewCell
//        case "UISegmentedControl": cell = currentViewObject as! UISegmentedControl
//        default : cell = currentViewObject as! UIButton
//        
//        }
//        switch desiredSuperView {
//        case "TableCell":
//            while !((cell is VehicleCell)){
//                cell = (cell as AnyObject).superview as Any
//            }
//          
//        case "CollectionCell":
//            while !((cell is  VehicleCollectionCell)){
//                cell = (cell as AnyObject).superview as Any
//            }
//           
//        default:
//            print("Input Dekho  BHai!!")
//                  }
//         return cell 
//    }
//
