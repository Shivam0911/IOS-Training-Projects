//
//  ImagesSearchVC.swift
//  WebServiceHitDemo
//
//  Created by MAC on 21/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class ImagesSearchVC: UIViewController  {

    //MARK: Outlets
    //==================
   
    @IBOutlet weak var imagesCollectionOutlet: UICollectionView!
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    var   ImagesList = [ImagesModel]()
    var  searchItem : String? = nil
    
    //MARK: View life Cycle
    //==================
    
    override func viewDidLoad()     {
        
            super.viewDidLoad()
            self.doSubViewLoad()
        
        }
    
    //MARK: doSubViewLoad Method
    //==================

   private  func doSubViewLoad()    {
    
    imagesCollectionOutlet.dataSource = self
    imagesCollectionOutlet.delegate = self
    let imageCollectioncellnib = UINib(nibName: "ImageCollectionViewCell", bundle: nil)
    imagesCollectionOutlet.register(imageCollectioncellnib, forCellWithReuseIdentifier: "ImageCollectionViewCellID")
    imagesCollectionOutlet.backgroundColor = UIColor.clear
    searchBarOutlet.delegate = self

    }
    // func touchesBegan used to auto hide keyboard On event touchesBegan
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)   {
        
        self.view.endEditing(true)
    
    }

    override func didReceiveMemoryWarning() {
       
        super.didReceiveMemoryWarning()
         
    }

}

    //MARK: UICollectionView DataSource , UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
    //==========================================================================

extension ImagesSearchVC : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    // Returns numberOfItemsInSection
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return  ImagesList.count
        
    }
    
    //MARK: collectionView cellForItemAt Method
    //================================
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCellID", for: indexPath) as? ImageCollectionViewCell
            else{
            fatalError("Cell Not Found !")
            }
        
    //MARK: Image Load From URL
    //=====================
        
        if let url = URL(string: ImagesList[indexPath.row].previewURL) {
           
            // gets  preview Url and sets the image of each cell
            
            cell.imageVIewToLoadOutlet.af_setImage(withURL : url)
            
            }
        
            cell.imageVIewToLoadOutlet.contentMode = .scaleAspectFill
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize(width:180.0,height:180.0)
        
    }
    //MARK: didSelectItemAt Method
    //=======================
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)   {
        
        guard  let url = URL(string: ImagesList[indexPath.row].webformatURL) else {
            fatalError("no webformat URL")
        }

    //MARK: Navigation Insatantiation
    //========================
        
        let storyBoardScene = UIStoryboard(name: "Main", bundle: Bundle.main)
        let navi = storyBoardScene.instantiateViewController(withIdentifier : "PreviewVCID") as! PreviewVC
       
        navi.imageUrl =  url  // sends high pixel rated URL of Selected Cell
        navi.title = self.title
        self.navigationController?.pushViewController(navi, animated: true)
        
    }

    
}

    //MARK: UISearchBarDelegate
    //=====================

extension  ImagesSearchVC : UISearchBarDelegate{

    //MARK: searchBarSearchButtonClicked Method
    //==================================
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if searchBar.text != ""     {
            
        self.title =   searchBar.text


    //MARK : Service Hit
    //==============
            
        WebServices().fetchDataFromPixabay(withQuery: searchItem!, success: { (images : [ImagesModel]) in
                
                self.ImagesList = images
                self.imagesCollectionOutlet.reloadData()
                      })  { (error : Error) in  print(error)}
        }
        else{
         
            let myAlert = UIAlertController(nibName : "TextField Empty!", bundle : nil)
            myAlert.addAction(UIAlertAction(title : "Ok",style : UIAlertActionStyle.default,handler:nil))
            
        }

    }


}
