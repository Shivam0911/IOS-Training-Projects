//
//  GridCellHoverLayout.swift
//  ListViewToGridViewConverter
//
//  Created by MAC on 15/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//
import Foundation

import UIKit

class GridCellHoverLayout: UICollectionViewFlowLayout {
    
    // here you can define the height of each cell
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
        print("ProductsGridFlowLayout INIT")
    }
    
    /**
     Sets up the layout for the collectionView. 1pt distance between each cell and 1pt distance between each row plus use a vertical layout
     */
    func setupLayout() {
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
        scrollDirection = .vertical
        print("ProductsGridFlowLayout setupLayout")
        
    }
    
    /// here we define the width of each cell, creating a 2 column layout. In case you would create 3 columns, change the number 2 to 3
    func itemWidth() -> CGFloat {
        print("ProductsGridFlowLayout width")
        return collectionView!.frame.width / 2 - 2
    }
    override var itemSize: CGSize {
        set {  print("ProductsGridFlowLayout set")
            self.itemSize =  CGSize(width: itemWidth(), height: itemWidth() + 20.0)
        }
        get {  print("ProductsGridFlowLayout get")
            return CGSize(width: itemWidth(), height: itemWidth() + 20.0)
        }
    }
    
}
