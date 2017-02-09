//
//  ColorExplorerVC.swift
//  mySecondDemo
//
//  Created by MAC on 01/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class rgbVC: UIViewController {
    
    
    @IBOutlet weak var textToChangeLabel: UILabel!
    
   
    var rColor : CGFloat = 0.0
    var gColor : CGFloat = 0.0
    var bColor : CGFloat = 0.0
   /*
     func changeColor(rColor : CGFloat ,gColor : CGFloat,bColor : CGFloat) 
     is used to change the color of the label textToChangeLabel
     */
    
    func changeColor(rColor : CGFloat ,gColor : CGFloat,bColor : CGFloat){
          self.textToChangeLabel.textColor = UIColor(red: self.rColor / 255, green: self.gColor / 255, blue: self.bColor / 255, alpha: 1)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }

        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func redSlider(_ sender: UISlider) {
        rColor = CGFloat(Int(sender.value)) // Used to retrive the value  from the RedSlider and store it in rColor variable
        self.changeColor(rColor: rColor, gColor: gColor, bColor: bColor)
           }
    
    @IBAction func greenSlider(_ sender: UISlider) {
        gColor = CGFloat(Int(sender.value)) // Used to get the value from the GreenSlider and store it in gColor variable
        self.changeColor(rColor: rColor, gColor: gColor, bColor: bColor)
     
    }
    
    @IBAction func blueSlider(_ sender: UISlider) {
        bColor = CGFloat(Int(sender.value)) // Used to get the value from the blueSlider and store it in bColor variable
        self.changeColor(rColor: rColor, gColor: gColor, bColor: bColor)
           }
  
    @IBAction func ChangeViewSwitch(_ sender: UISwitch) {
        if sender .isOn{
           

            
        }
    }
    
    @IBAction func nextVCButton(_ sender: UIButton) {
        let navi = storyboard?.instantiateViewController(withIdentifier: "nextViewID") as! nextViewVC
        navi.tempString = "\(rColor)"
        navigationController?.pushViewController(navi, animated: true)
    }
    

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
