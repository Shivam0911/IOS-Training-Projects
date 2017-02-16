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
    @IBOutlet weak var appInventivLogo: UIImageView!
    @IBOutlet weak var listButtonOutlet: UIButton!
    @IBOutlet weak var gridButtonOutlet: UIButton!
    @IBOutlet weak var imageViewCollectionOutlet: UICollectionView!
    @IBOutlet weak var deleteButtonOutlet: UIButton!
    @IBOutlet weak var noOfPhotos: UILabel!
    let gridCellHover = GridCellHoverLayout()
    let gridCell = GridViewCell()
    let listCell = listViewCell()
    var selectedArray = [IndexPath]()
    var buttonPressed = ButtonPressed.gridButtonPressed
    let carData = CarData()
    let listLayout = ProductsListFlowLayout()
    let gridLayout = ProductsGridFlowLayout()

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
         noOfPhotos.text = "\(carData.car.count)  Photos"
        imageViewCollectionOutlet.allowsSelection = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imageViewCollectionOutlet.collectionViewLayout.invalidateLayout()
        self.imageViewCollectionOutlet.setCollectionViewLayout(self.gridLayout, animated: true)
    }
    
    //MARK: deleteButtonAction
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        
        imageViewCollectionOutlet.allowsSelection = false
        let countOfTotalPhotos = carData.car.count
        for indexPath in selectedArray.sorted(by: >){
            carData.car.remove(at: indexPath.item)
            imageViewCollectionOutlet.deleteItems(at: [indexPath])
        }
        noOfPhotos.text = "\(countOfTotalPhotos - selectedArray.count) Photos"
    
    //MARK: imageViewCollectionOutlet.reloadData()
        deleteButtonOutlet.isHidden = true
        selectedArray = [IndexPath]()
    }
    
    //MARK: didSelect Method
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.gray
        selectedArray.append(indexPath)
//        let anime = CABasicAnimation(keyPath: "Opacity")
//        anime.fromValue = 1.0
//        anime.toValue = 0.3
//        anime.duration = 1.0
        
//        UIView.animate(withDuration: 0.5,delay : 0.0,options : .repeat , animations: {
//            //cell?.alpha = 0.0
//            cell?.frame.origin.x += 5
//        })
    }
    
    //MARK: didDeselect Method
    func collectionView(_ collectionView: UICollectionView , didDeselectItemAt indexPath: IndexPath ){
        let cell = collectionView.cellForItem(at: indexPath)
        selectedArray.remove(at: selectedArray.index(of: indexPath)!)
        cell?.backgroundColor = nil
        
        print("didselect\(selectedArray)")
        if selectedArray.count == 0{
             deleteButtonOutlet.isHidden = true
            }
    }
}

extension ListToGridVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.carData.car.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    //MARK:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if  indexPath.item < carData.car.count {
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
    }
    
    //MARK: GridButtonAction Method
    @IBAction func gridButtonPressed(_ sender: UIButton) {
        buttonPressed = .gridButtonPressed
        print(buttonPressed)
        imageViewCollectionOutlet.reloadData()
        changebackGroundOfButton(sender)
        listButtonOutlet.backgroundColor = UIColor.lightGray
        animateObject(self.gridLayout)
    }
    
    //MARK: ListButtonAction Method
    @IBAction func listButtonPressed(_ sender: UIButton) {
        buttonPressed = .listButtonPressed
        imageViewCollectionOutlet.reloadData()
        changebackGroundOfButton(sender)
        gridButtonOutlet.backgroundColor = UIColor.lightGray
        animateObject(self.listLayout)
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
        if selectedArray.isEmpty{
            cell.backgroundColor = nil
        }
        else{
            for index in selectedArray{
                if indexPath == index{
                    cell.backgroundColor = UIColor.gray
                }
            }
        }
        return cell
    }
    
    //MARK: ReturnListCell Method
    func returnListCell(_ collectionView: UICollectionView,_ indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListID", for: indexPath) as? listViewCell else{
            fatalError("Cell Not Found !")
        }
        if selectedArray.isEmpty{
        cell.backgroundColor = nil
        }
        else{
            for index in selectedArray{
                if indexPath == index{
                        cell.backgroundColor = UIColor.gray
                }
            }
        }
        cell.populateTheData(carData.car[indexPath.item] as! [String : String])
        return cell
    }
    
    //MARK: GestureRecogniser Selector Method selectOnPress
    func selectOnPress(gesture : UILongPressGestureRecognizer){
        deleteButtonOutlet.isHidden = false
        imageViewCollectionOutlet.allowsMultipleSelection = true
        
        if gesture.state == .ended{
            return
        }
        let pressPoint = gesture.location(in: self.imageViewCollectionOutlet)
        if let indexPath = self.imageViewCollectionOutlet.indexPathForItem(at: pressPoint){
            imageViewCollectionOutlet.selectItem(at: indexPath, animated: false, scrollPosition: .centeredVertically)
            collectionView(imageViewCollectionOutlet, didSelectItemAt: indexPath)
            print(selectedArray)
        }
        else {
            print("no cell found with index")
            imageViewCollectionOutlet.allowsMultipleSelection = false
        }
    }
    //MARK: animateObject 
    func animateObject(_ layoutObject : UICollectionViewLayout){
        let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
        UIView.animate(withDuration: 0.8) { () -> Void in
            self.imageViewCollectionOutlet.collectionViewLayout.invalidateLayout()
            self.imageViewCollectionOutlet.setCollectionViewLayout(layoutObject , animated: true)
        }
        DispatchQueue.main.asyncAfter(deadline: when) {
        }
    
    }
}


