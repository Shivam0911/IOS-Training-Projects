//
//  nextViewVC.swift
//  RGBSlider
//
//  Created by MAC on 02/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class nextViewVC: UIViewController {

    @IBOutlet weak var LabelToChange: UILabel!
    @IBOutlet weak var textViewToChange: UITextView!
    var tempString : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.LabelToChange.text = tempString
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
