//
//  ListToGridVC.swift
//  ListViewToGridViewConverter
//
//  Created by MAC on 13/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit
enum ButtonPressed{
    case gridButtonPressed
    case listButtonPressed
}

class ListToGridVC: UIViewController {
        var selectedArray = [IndexPath]()
        var buttonPressed = ButtonPressed.gridButtonPressed
        let carData = CarData()
        let listLayout = ProductsListFlowLayout()
        let gridLayout = ProductsGridFlowLayout()
        @IBOutlet weak var appInventivLogo: UIImageView!
        @IBOutlet weak var listButtonOutlet: UIButton!
        @IBOutlet weak var gridButtonOutlet: UIButton!
        @IBOutlet weak var imageViewCollectionOutlet: UICollectionView!
        @IBOutlet weak var deleteButtonOutlet: UIButton!
        //MARK: ViewLife Cycle
        override func viewDidLoad() {
            super.viewDidLoad()
            imageViewCollectionOutlet.dataSource = self
            imageViewCollectionOutlet.delegate = self
            let listcellnib = UINib(nibName: "listViewCell", bundle: nil)
            imageViewCollectionOutlet.register(listcellnib, forCellWithReuseIdentifier: "ListID")
            let gridcellnib = UINib(nibName: "GridViewCell", bundle: nil)
            imageViewCollectionOutlet.register(gridcellnib, forCellWithReuseIdentifier: "GridCellID")
            appInventivLogo.layer.cornerRadius = appInventivLogo.layer.bounds.width/2
            //MARK:Register GestureRecogniser
            let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.selectOnPress))
            longPressGesture.delegate = self
            imageViewCollectionOutlet.addGestureRecognizer(longPressGesture)
            longPressGesture.minimumPressDuration = 0.3
            deleteButtonOutlet.isHidden = true
            deleteButtonOutlet.layer.cornerRadius = deleteButtonOutlet.layer.bounds.height/2
        }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.imageViewCollectionOutlet.collectionViewLayout.invalidateLayout()
            self.imageViewCollectionOutlet.setCollectionViewLayout(self.gridLayout, animated: true)
        }
        //MARK: deleteButtonAction
    
        @IBAction func deleteButtonAction(_ sender: UIButton) {
       // perform deletion of selected element
        for indexPath in selectedArray.sorted(by: >){
            carData.car.remove(at: indexPath.item)
        }
        imageViewCollectionOutlet.reloadData()
        selectedArray = [IndexPath]()
    
    }
}
extension ListToGridVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.carData.car.count
        }
        // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if  indexPath.row < carData.car.count {
            if buttonPressed == .gridButtonPressed {
                let cell1 = returnGridCell(collectionView,indexPath)
                return cell1
                }
            else{
                let cell2 = returnListCell(collectionView,indexPath)
                return cell2
                }
            }
            else {
             fatalError("no cell to display")
            }
        }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }
        //MARK: GridButtonAction Method
        @IBAction func gridButtonPressed(_ sender: UIButton) {
            buttonPressed = .gridButtonPressed
            print(buttonPressed)
            imageViewCollectionOutlet.reloadData()
            changebackGroundOfButton(sender)
            listButtonOutlet.backgroundColor = UIColor.lightGray
            let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
            UIView.animate(withDuration: 0.8) { () -> Void in
                self.imageViewCollectionOutlet.collectionViewLayout.invalidateLayout()
                self.imageViewCollectionOutlet.setCollectionViewLayout(self.gridLayout, animated: true)
            }

            DispatchQueue.main.asyncAfter(deadline: when) {
                       }
        }
        //MARK: ListButtonAction Method
        @IBAction func listButtonPressed(_ sender: UIButton) {
            buttonPressed = .listButtonPressed
            imageViewCollectionOutlet.reloadData()
            changebackGroundOfButton(sender)
            gridButtonOutlet.backgroundColor = UIColor.lightGray
            UIView.animate(withDuration: 0.8) { () -> Void in
                self.imageViewCollectionOutlet.collectionViewLayout.invalidateLayout()
                self.imageViewCollectionOutlet.setCollectionViewLayout(self.listLayout, animated: true)
            }
            let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
                         }
        }
        //MARK: changebackGroundOfButton Method
        func changebackGroundOfButton(_ sender: UIButton){
            sender.backgroundColor = UIColor.gray
            sender.titleLabel?.textColor = UIColor.white
        }

}

extension ListToGridVC : UIGestureRecognizerDelegate{
        //MARK: ReturnGridCell Method
        func returnGridCell(_ collectionView: UICollectionView,_ indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCellID", for: indexPath) as? GridViewCell else{
                    fatalError("Cell Not Found !")
                    }
            cell.populateTheDataInGridView(carData.car[indexPath.item] as! [String : String])
            cell.backgroundColor = nil
            return cell
        }
        //MARK: ReturnListCell Method
        func returnListCell(_ collectionView: UICollectionView,_ indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListID", for: indexPath) as? listViewCell else{
                    fatalError("Cell Not Found !")
                    }
            cell.backgroundColor = nil
            cell.populateTheData(carData.car[indexPath.item] as! [String : String])
            return cell
        }
        //MARK: GestureRecogniser Selector Method selectOnPress
        func selectOnPress(gesture : UILongPressGestureRecognizer){
            deleteButtonOutlet.isHidden = false
            gesture.minimumPressDuration = 0.02
            if gesture.state == .ended{
                return
            }
            let pressPoint = gesture.location(in: self.imageViewCollectionOutlet)
            if let indexPath = self.imageViewCollectionOutlet.indexPathForItem(at: pressPoint){
                    let cell = self.imageViewCollectionOutlet.cellForItem(at: indexPath)
                    cell?.isSelected = true
                    if selectedArray.contains(indexPath){
                        selectedArray.remove(at: selectedArray.index(of: indexPath)!)
                        cell?.isSelected = false
                        cell?.backgroundColor = nil
                    }
                    else{
                        selectedArray.append(indexPath)
                        cell?.backgroundColor = UIColor.gray
                    }
                print(selectedArray)
            }
            
        }
    
}


