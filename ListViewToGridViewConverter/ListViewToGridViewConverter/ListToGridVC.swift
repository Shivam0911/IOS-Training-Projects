//
//  ListToGridVC.swift
//  ListViewToGridViewConverter
//
//  Created by MAC on 13/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class ListToGridVC: UIViewController {
        var flag = 0
        let carData = CarData()
        let indexCount = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]
        @IBOutlet weak var appInventivLogo: UIImageView!
        @IBOutlet weak var listButtonOutlet: UIButton!
        @IBOutlet weak var gridButtonOutlet: UIButton!
        @IBOutlet weak var imageViewCollectionOutlet: UICollectionView!
        override func viewDidLoad() {
        super.viewDidLoad()
            imageViewCollectionOutlet.dataSource = self
            imageViewCollectionOutlet.delegate = self
            let listcellnib = UINib(nibName: "listViewCell", bundle: nil)
            imageViewCollectionOutlet.register(listcellnib, forCellWithReuseIdentifier: "ListID")
            let gridcellnib = UINib(nibName: "GridViewCell", bundle: nil)
            imageViewCollectionOutlet.register(gridcellnib, forCellWithReuseIdentifier: "GridCellID")
            appInventivLogo.layer.cornerRadius = appInventivLogo.layer.bounds.width/2
//          self.listButtonOutlet.layer.borderWidth = 1
//          self.listButtonOutlet.layer.borderColor = UIColor.black.cgColor
//          self.gridButtonOutlet.layer.borderWidth = 1
//          self.gridButtonOutlet.layer.borderColor = UIColor.black.cgColor
            // Do any additional setup after loading the view.
            
    }
}
extension ListToGridVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.carData.car.count
        }
        // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            print("flag = \(flag)")
            print(#function)
            if  indexPath.row < carData.car.count {
            if flag == 0 {
                let cell1 = returnGridCell(collectionView,indexPath)
                return cell1
                }
            else {
                let cell2 = returnListCell(collectionView,indexPath)
                return cell2
                }
            }
            else {
             fatalError("no cell to display")
            }
        }
        
        //    MARK: UICollectionViewDelegateFlowLayout Methods
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
            return CGSize(width: 30, height: 30)
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            if flag == 0 {
                let width = 170.0
                return CGSize(width: width, height: width + 20.0)
            }
            else {
                let width = 400 //self.imageViewCollectionOutlet.frame.width
                return CGSize(width: width, height: 70)
            }
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 2.0
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 1.0
        }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }
        //MARK : GridButtonAction
        @IBAction func gridButtonPressed(_ sender: UIButton) {
        flag = 0
        imageViewCollectionOutlet.reloadData()
        sender.backgroundColor = UIColor.gray
        sender.titleLabel?.textColor = UIColor.white
        listButtonOutlet.backgroundColor = UIColor.lightGray
       // imageViewCollectionOutlet.performBatchUpdates({ }, completion: nil)
        }
        //MARK : ListButtonAction
        @IBAction func listButtonPressed(_ sender: UIButton) {
        flag = 1
        imageViewCollectionOutlet.reloadData()
        sender.backgroundColor = UIColor.gray
        sender.titleLabel?.textColor = UIColor.white
        gridButtonOutlet.backgroundColor = UIColor.lightGray
       // imageViewCollectionOutlet.performBatchUpdates({ }, completion: nil)
        }
}
extension ListToGridVC {
        //MARK : ReturnGridCell Method
        func returnGridCell(_ collectionView: UICollectionView,_ indexPath: IndexPath) -> UICollectionViewCell {
            print("flag = \(flag)")
            print(#function)

            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCellID", for: indexPath) as? GridViewCell else{
                    fatalError("Cell Not Found !")
                    }
            cell.populateTheDataInGridView(carData.car[indexPath.item] as! [String : String])
            return cell
        }
        //MARK: ReturnListCell Method
        func returnListCell(_ collectionView: UICollectionView,_ indexPath: IndexPath) -> UICollectionViewCell {
            print("flag = \(flag)")
            print(#function)

            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListID", for: indexPath) as? listViewCell else{
                    fatalError("Cell Not Found !")
                    }
            cell.populateTheData(carData.car[indexPath.item] as! [String : String])
            return cell
        }
    
}

