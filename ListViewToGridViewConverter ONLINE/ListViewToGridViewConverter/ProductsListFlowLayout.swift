//
//  ProductsListFlowLayout.swift
//  ListViewToGridViewConverter
//
//  Created by MAC on 14/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class ProductsListFlowLayout: UICollectionViewFlowLayout {
    
    let itemHeight: CGFloat = 60
    
    override init() {
        super.init()
        setupLayout()
    }
    
    /**
     Init method
     
     - parameter aDecoder: aDecoder
     
     - returns: self
     */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
         print("ProductsListFlowLayout INIT")
    }
    
    /**
     Sets up the layout for the collectionView. 0 distance between each cell, and vertical layout
     */
    func setupLayout() {
        minimumInteritemSpacing = 0
        minimumLineSpacing = 1
        scrollDirection = .vertical
          print("ProductsListFlowLayout setupLaout")
    }
    
    func itemWidth() -> CGFloat {
          print("ProductsListFlowLayout width")
        return collectionView!.frame.width
    }
    
    override var itemSize: CGSize {
        set {
              print("ProductsListFlowLayout set")
            self.itemSize = CGSize(width: itemWidth(),height: itemHeight)
        }
        get {
            print("ProductsListFlowLayout get")
            return CGSize(width: itemWidth(),height: itemHeight)
        }
    }
    
    
}
