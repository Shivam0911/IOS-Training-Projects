//
//  MainVC.swift
//  SliderDemo
//
//  Created by MAC on 23/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    

    
    @IBOutlet weak var sliderButtonOutlet: UIButton!
    
    var leftSliderController = LeftSliderVC()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        doSubViewLoad()
    }
    
    //MARK: doSubViewLoad Method
    //=======================
    
   fileprivate  func doSubViewLoad()    {
    
       
        let storyBoardScene = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        leftSliderController = storyBoardScene.instantiateViewController(withIdentifier : "LeftSliderVCID") as! LeftSliderVC
        
        view.addSubview(leftSliderController.view)
        
        addChildViewController(leftSliderController)
        
        leftSliderController.didMove(toParentViewController: self)
        
        leftSliderController.view.frame = CGRect(x: -(self.view.frame.width - 100)
        , y: 0, width: self.view.frame.width - 100, height: self.view.frame.height  )
    
    }
   
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension MainVC    {
    
    //MARK: chnageSubView Method
    //=======================
    func changeSubView( _ subViewController : UIViewController )    {
        
        leftSliderController.removeFromParentViewController()
        
        subViewController.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width , height: self.view.frame.height   )
        
        view.addSubview(subViewController.view)
        
        addChildViewController(subViewController)
        
        sliderButtonOutlet.isSelected = false
        
        doSubViewLoad()
        
        subViewController.view.frame = CGRect(x: 0 , y: 0, width: self.view.frame.width , height: self.view.frame.height  )
    
    }
    
    //MARK: sliderButtonTapped Method
    //==========================
    @IBAction func sliderButtonTapped(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
       
              if sender.isSelected    {
            
                UIView.animate(withDuration: 1, delay: 0.1, options: .curveEaseOut, animations: {
                    
                    self.leftSliderController.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - 150, height: self.view.frame.height)
                    
                })
        }
        else    {
                
                UIView.animate(withDuration: 1, delay: 0.1, options: .curveEaseOut, animations: {

                    self.leftSliderController.view.frame = CGRect(x: -(self.view.frame.width - 150), y: 0, width: self.view.frame.width - 150, height: self.view.frame.height)
                    
               })
       }

    }
    
}
